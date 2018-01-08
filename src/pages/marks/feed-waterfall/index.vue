<template lang="jade">
  .feed-waterfall(:style="style")
    feed-item(v-for="feed in feeds", :key="feed.id", :feed="feed", :col-heights="colHeights" @complete-layout="completeLayout")
</template>


<script lang="coffee">
  module.exports =
    components:
      'feed-item': require('./feed-item')

    props:
      'feeds':
        type: Array
        default: -> []

    data: ->
      clientWidth = document.body.clientWidth
      cols = parseInt(clientWidth / 224)
      colHeights = []
      colHeights[i] = 0 for i in [0...cols]
      return{
        cols: cols
        colHeights: colHeights
      }

    computed:
      width:  -> @cols * 224
      height: -> @getMax() + 5

      style: ->
        width:  @width  + 'px'
        height: @height + 'px'

    methods:
      init: ->
        clientWidth = document.body.clientWidth
        cols = parseInt(clientWidth / 224)
        colHeights = []
        colHeights[i] = 0 for i in [0...cols]
        @cols = cols
        @colHeights = colHeights

      getMax: ->
        return Math.max.apply(null, @colHeights);

      completeLayout: ({i, height}) ->
        @$set(@colHeights, i, @colHeights[i] + height)
</script>


<style lang="less" scoped>
  .feed-waterfall{
    margin-top: 60px;
    background-color: rgba(245, 245, 245, 1);
    position: relative;
  }
</style>