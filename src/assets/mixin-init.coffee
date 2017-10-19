module.exports = install: (Vue) -> Vue.mixin({
  
  # 基于keep-alive的组件只会调用一次created
  created: ->
    if(@init) then @init()


  # 基于keep-alive的组件在created后会调用一次，然后每次激活时都会调用
  # 其子组件在created后不会调用，只在每次激活时调用
  activated: ->
    # 记录本组件被激活的次数
    @__activateCount ?= 0
    @__activateCount += 1

    if(@init)
      # 延时的理由：
      # 参考根组件中justBack的实现手段，
      # popstate事件比activated晚触发，
      # 为了获取正确的justBack，一个tick的延时是必要的
      setTimeout =>
        # 不是通过浏览器的「前进/后退」按钮激活的
        # @REVIEW 是否需要进一步区分前进与后退，在前进时加载数据比较合理？
        justBack  = @state['router'].justBack
        keepAlive = @$route.meta.keepAlive
        if(!justBack)
          # 若是keep-alive组件，第一次激活时不加载，因为created时加载过一次了
          if(keepAlive)
            @init() if @__activateCount > 1
          else
            @init()
})