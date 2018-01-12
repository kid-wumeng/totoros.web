<template lang="jade">
  #marks(:style="style")
    feed-waterfall(v-if="showFeedWaterfall")
</template>


<script lang="coffee">
  module.exports =
    components:
      'feed-waterfall': require('./feed-waterfall')

    data: ->
      showFeedWaterfall: true

    computed:
      style: ->
        'minHeight': document.body.clientHeight - 64 + 'px'

    created: ->
      @listen('RESET_MARKS', @resetMarks)

    methods:
      resetMarks: ->
        @showFeedWaterfall = false
        setTimeout (=> @showFeedWaterfall = true), 0
</script>


<style lang="less" scoped>
  #marks{
    background-image: url(http://pattern8.com/images/pattern-thumbs/pattern8-pattern-21a.png);
    overflow: hidden;
    width: 100%;
  }
</style>
