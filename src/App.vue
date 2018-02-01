<template lang="jade">
  #app(:style="appStyle")
    c-header
    .body(:style="bodyStyle")
      keep-alive
        router-view(v-if="$route.meta.keepAlive && auth", :key="key")
      router-view(v-if="!$route.meta.keepAlive && auth")

    //- totoro
    toast
    notify
    confirm
    prompt
    search-modal
</template>


<script lang="coffee">
  module.exports =
    components:
      'c-header':     require('components/@/header')
      # 'totoro':       require('components/@/totoro')
      'toast':        require('components/@/toast')
      'notify':       require('components/@/notify')
      'prompt':       require('components/@/prompt')
      'confirm':      require('components/@/confirm')
      'search-modal': require('components/@/search-modal')


    metaInfo: ->
      titleTemplate: (title) ->
        if title then "#{title} - 龙猫 ACG 社区" else '龙猫 ACG 社区'

    computed:
      key: ->
        prefix = @$route?.meta?.key?.prefix ? ''
        params = @$route?.meta?.key?.params ? []
        query  = @$route?.meta?.key?.query  ? []
        hash   = @$route?.hash

        params = params.map (name) => @$route.params?[name] ? ''
        query  = query.map  (name) => @$route.query?[name]  ? ''

        key = prefix + params.join('') + query.join('') + hash
        return if key then key else null


      auth: ->
        if(@$route.meta.admin is true)
          if(@admin)
            return true
          else
            return false

        if(@$route.meta.login is true)
          if(@login)
            return true
          else
            return false

        if(@$route.meta.login is false)
          if(!@login)
            return true
          else
            return false

        return true


      appStyle: ->
        if(@$route?.meta?.bgColor)
          return{
            backgroundColor: 'rgba(250, 250, 250, 1)'
          }

      bodyStyle: ->
        if(@$route?.meta?.bgImage)
          return{
            backgroundImage: 'url(http://cdn.totoros.cc/assets/big-bg)'
          }

    watch:
      '$route': ->
        @commit('router/SET_JUST_BACK', false)

    created: ->
      window.addEventListener 'popstate', =>
        @commit('router/SET_JUST_BACK', true)
</script>


<style lang="less">

  @import '~assets/widgets';

  @font-face{
    font-family: "Lato";
    src: url(http://oy0aiwj7c.bkt.clouddn.com/assets/Lato-Regular.ttf?2017.11.03);
  }
  @font-face{
    font-family: "Lato";
    src: url(http://oy0aiwj7c.bkt.clouddn.com/assets/Lato-Semibold.ttf?2017.11.03);
    font-weight: 500;
  }
  @font-face{
    font-family: "Lato";
    src: url(http://oy0aiwj7c.bkt.clouddn.com/assets/Lato-Bold.ttf?2017.11.03);
    font-weight: 600;
  }

  *{
    margin: 0;
    border: 0;
    padding: 0;
    font-family: "Lato", "Helvetica Neue", "PingFang SC", "Hiragino Sans GB", "Microsoft YaHei", "微软雅黑", Arial, sans-serif;
    font-size: 14px;
    color: #445669;
    outline: none;
    -webkit-tap-highlight-color: transparent;
  }

  a{
    display: block;
    text-decoration: none;
  }

  .icon{
    font: normal normal normal 14px/1 FontAwesome;
    font-size: inherit;
    text-rendering: auto;
    -webkit-font-smoothing: antialiased;
    -moz-osx-font-smoothing: grayscale;
  }

  html{
    height: 100%;
    -webkit-font-smoothing: antialiased;
    -moz-osx-font-smoothing: grayscale;
  }

  body{
    height: 100%;
  }

  #app{
    min-height: 100%;
    display: flex;
    flex-direction: column;
    align-items: center;
    .body{
      flex: auto;
      width: 100%;
      margin-top: 64px;
    }
  }
</style>
