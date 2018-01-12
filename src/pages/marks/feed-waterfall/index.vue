<template lang="jade">
  .feed-waterfall(:style="style")
    feed-item(
      v-for="feed in feeds",
      :key="feed.id",
      :feed="feed",
      :col-heights="colHeights",
      :width="eachWidth"
      @complete-layout="completeLayout")
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

      if(clientWidth <= 346)
        cols = 1
      else if(clientWidth <= 570)
        cols = 2
      else if(clientWidth <= 794)
        cols = 3
      else if(clientWidth <= 1018)
        cols = 4
      else if(clientWidth <= 1242)
        cols = 5
      else if(clientWidth <= 1466)
        cols = 6
      else if(clientWidth <= 1690)
        cols = 7
      else
        cols = 8

      eachWidth = (clientWidth - 10) / cols
      colHeights = []
      colHeights[i] = 0 for i in [0...cols]
      return{
        cols: cols
        colHeights: colHeights
        eachWidth: eachWidth
      }

    computed:
      width:  -> @cols * @eachWidth
      height: ->
        clientHeight = document.body.clientHeight
        max = @getMax() + 5
        if(clientHeight > max)
          return clientHeight
        else
          return max

      style: ->
        width:  @width  + 'px'
        height: @height + 'px'

    methods:
      init: ->
        console.log 2222
        clientWidth = document.body.clientWidth

        if(clientWidth <= 346)
          cols = 1
        else if(clientWidth <= 570)
          cols = 2
        else if(clientWidth <= 794)
          cols = 3
        else if(clientWidth <= 1018)
          cols = 4
        else if(clientWidth <= 1242)
          cols = 5
        else if(clientWidth <= 1466)
          cols = 6
        else if(clientWidth <= 1690)
          cols = 7
        else
          cols = 8

        @eachWidth = (clientWidth - 10) / cols
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
    position: relative;
  }
</style>