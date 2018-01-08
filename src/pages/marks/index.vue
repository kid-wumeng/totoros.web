<template lang="jade">
  #marks
    feed-waterfall(:feeds="feeds")
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
    // background-image: url(http://oy0aiwj7c.bkt.clouddn.com/assets/marks-bg?2018-01-08);
    // background-position: center;
    // background-repeat: no-repeat;
    // background-attachment: fixed;
    background-color: rgba(245, 245, 245, 1);
    overflow: hidden;
    .feed-waterfall{
      margin: 30px auto 10px;
    }
    .more{
      padding: 60px 0;
      text-align: center;
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
