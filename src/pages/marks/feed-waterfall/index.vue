<template lang="jade">
  .feed-waterfall(v-if="feeds.length")
    .wrap(:style="wrapStyle")
      feed-item(
        v-for="feed in feeds",
        :key="feed.id",
        :feed="feed",
        :width="eachWidth",
        @load="load"
      )
    .more(v-if="showMoreButton")
      .more-button(@click="more") 加载更多标记
</template>


<script lang="coffee">
  module.exports =
    components:
      'feed-item': require('./feed-item')

    data: ->
      feeds: []
      page:  1
      size:  50
      total: 0
      loading: false
      showMoreButton: false

      cols: 0
      eachWidth: 0
      colHeights: []

    computed:
      wrapWidth:  -> @cols * @eachWidth
      wrapHeight: -> @getMax() + 5
      wrapStyle: ->
        width:  @wrapWidth  + 'px'
        height: @wrapHeight + 'px'

    created: ->
      @init()

    methods:
      init: ->
        @computeCols()
        @computeEachWidth()
        @initColHeights()
        @feeds = await @fetch()

      more: ->
        @page += 1
        feeds = await @fetch()
        if(feeds.length)
          @feeds = @feeds.concat(feeds)
        else
          @toast('没有更多了')

      # 计算列数
      computeCols: ->
        clientWidth = document.body.clientWidth
        if(clientWidth <= 346)
          @cols = 1
        else if(clientWidth <= 570)
          @cols = 2
        else if(clientWidth <= 794)
          @cols = 3
        else if(clientWidth <= 1018)
          @cols = 4
        else if(clientWidth <= 1242)
          @cols = 5
        else if(clientWidth <= 1466)
          @cols = 6
        else if(clientWidth <= 1690)
          @cols = 7
        else
          @cols = 8

      # 计算每列的宽度
      computeEachWidth: ->
        clientWidth = document.body.clientWidth
        @eachWidth = (clientWidth - 10) / @cols

      # 初始化colHeights
      initColHeights: ->
        colHeights = []
        colHeights[i] = 0 for i in [0...@cols]
        @colHeights = colHeights

      # 获取最小高度的列
      getMinIndex: ->
        min = Math.min.apply(null, @colHeights);
        index = @colHeights.indexOf(min)
        return index

      # 获取最大高度
      getMax: ->
        return Math.max.apply(null, @colHeights);

      # item加载完毕事件，计算并设置left与top
      load: ({$el, height}) ->
        index  = @getMinIndex()
        width  = @eachWidth
        height = height
        $el.style.left = width * index + 'px'
        $el.style.top = @colHeights[index] + 'px'
        @$set(@colHeights, index, @colHeights[index] + height)

      fetch: ->
        if(@loading)
          return
        else
          @loading = true

        result = await api.call('feed.getAll', {
          types: ['create-post', 'update-post']
          page: @page
          size: @size
        })

        @total          = result.total
        @showMoreButton = true
        @loading        = false

        return result.feeds
</script>


<style lang="less" scoped>
  .feed-waterfall{
    >.wrap{
      margin: 5px auto 0;
      position: relative;
    }
    >.more{
      padding: 24px 0;
      text-align: center;
      background-color: #FFF;
      .more-button{
        display: inline-block;
        padding: 10px 24px;
        font-size: 16px;
        font-weight: 600;
        color: #707C88;
        border: 2px solid #707C88;
        cursor: pointer;
      }
    }
  }
</style>