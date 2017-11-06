<template lang="jade">
  #public-timeline(v-if="feeds.length")
    feed-list(:feeds="feeds")
    .hint(v-if="moreSure")
      .more(v-if="moreShow", @click="more") ... 加载更多
      .no-more(v-else) ... 没有更多了
</template>


<script lang="coffee">
  module.exports =
    components:
      'feed-list': require('components/timeline/feed-list')

    computed:
      feeds:    -> @state['public-timeline'].feeds
      moreSure: -> @state['public-timeline'].moreSure
      moreShow: -> @state['public-timeline'].moreShow

    methods:
      init: ->
        @dispatch('public-timeline/init')

      more: ->
        @dispatch('public-timeline/more')
</script>


<style lang="less" scoped>
  #public-timeline{
    margin: 32px auto;
    width: 600px;
    .more{
      border-top: 1px solid #EEE;
      border-bottom: 1px solid #EEE;
      padding: 12px 0;
      margin-top: 32px;
      text-align: center;
      font-weight: 600;
      font-size: 14px;
      cursor: pointer;
    }
    .no-more{
      margin-top: 32px;
      text-align: center;
      font-size: 13px;
      color: #AAA;
    }
  }
</style>