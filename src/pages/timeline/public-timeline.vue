<template lang="jade">
  #public-timeline
    feed-list(:feeds="feeds")
</template>


<script lang="coffee">
  module.exports =
    components:
      'feed-list': require('components/timeline/feed-list')

    computed:
      feeds: -> @state['public-timeline'].feeds

    created: ->
      @init()

    methods:
      init: ->
        @dispatch('public-timeline/init')
</script>


<style lang="less" scoped>
  #public-timeline{
    margin: 30px auto;
    width: 650px;
  }
</style>