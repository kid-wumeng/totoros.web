<template lang="jade">
  #right-timeline(v-if="feeds.length")
    feed-list-simple(:feeds="feeds")
</template>


<script lang="coffee">
  module.exports =
    components:
      'feed-list-simple': require('components/timeline/feed-list-simple')

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
  #right-timeline{
    flex: auto;
    margin-left: 50px;
  }
</style>