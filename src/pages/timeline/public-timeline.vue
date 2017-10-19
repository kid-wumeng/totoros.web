<template lang="jade">
  #public-timeline
    feed-list(:feeds="feeds")
    .more(v-if="!over", @click="more") ... 加载更多
</template>


<script lang="coffee">
  module.exports =
    components:
      'feed-list': require('components/timeline/feed-list')

    computed:
      feeds: -> @state['public-timeline'].feeds
      over:  -> @state['public-timeline'].over

    created: ->
      @init()

    methods:
      init: ->
        @dispatch('public-timeline/init')

      more: ->
        @dispatch('public-timeline/more')
</script>


<style lang="less" scoped>
  #public-timeline{
    margin: 32px auto;
    width: 700px;
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
  }
</style>