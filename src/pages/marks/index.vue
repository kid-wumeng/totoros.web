<template lang="jade">
  #marks
    feed-waterfall(v-if="feeds.length", :feeds="feeds")
    .more(v-if="showMoreButton")
      .more-button(@click="more") 加载更多标记
</template>


<script lang="coffee">
  module.exports =
    components:
      'feed-waterfall': require('./feed-waterfall')

    data: ->
      feeds: []
      page:  0
      size:  50
      total: 0
      loading: false
      showMoreButton: false

    methods:
      init: ->
        @feeds = []
        @page  = 0
        @showMoreButton = false
        @load()

      more: ->
        @load()

      load: ->
        if(@loading)
          return

        @loading = true
        @page += 1
        result = await api.call('feed.getAll', {
          types: ['create-post', 'update-post']
          page: @page
          size: @size
        })
        if(result.feeds.length)
          @feeds = @feeds.concat(result.feeds)
          @total = result.total
        else
          @toast('没有更多了')
        @showMoreButton = true
        @loading = false
</script>


<style lang="less" scoped>
  #marks{
    background-image: url(http://pattern8.com/images/pattern-thumbs/pattern8-pattern-21a.png);
    overflow: hidden;
    .feed-waterfall{
      margin: 5px auto 10px;
    }
    .more{
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
