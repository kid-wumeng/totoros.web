<template lang="jade">
  .mark-progress
    .progress-bar
      .active(:class="{'-gte-half': percent >= 50}", :style="activeStyle")
    .number
      span(:class="{'-gte-half': percent >= 50}") {{ progress }}
      span.sep /
      span {{ episodeCount }}
</template>


<script lang="coffee">
  module.exports =
    props:
      'mark':
        type: Object
        required: true

    computed:
      episodeCount: ->
        return @mark.subject?.episodeCount ? 0

      progress: ->
        progress = @mark.progress ? 0
        if progress > @episodeCount
          return @episodeCount
        else
          return progress

      percent: ->
        if @episodeCount
          return @progress / @episodeCount * 100
        else
          return 0

      activeStyle: ->
        width: @percent + '%'
</script>


<style lang="less" scoped>
  .mark-progress{
    box-sizing: border-box;
    width: 100%;
    .progress-bar{
      flex: auto;
      height: 6px;
      padding: 1px;
      background-color: rgba(247, 247, 247, 1);
      border: 1px solid rgb(240, 240, 240);
      border-radius: 2px;
      .active{
        height: 6px;
        background-image: linear-gradient(90deg, #ffce3d 0%, #ffbf00 90%);
        border-radius: 2px;
      }
      .active.-gte-half{
        background-image: linear-gradient(90deg, #66C277 0%, #16a085 90%);
      }
    }
    .number{
      margin-top: 4px;
      text-align: right;
      opacity: 0.6;
      span{
        font-weight: 600;
        font-size: 17px;
        color: #A2AEBA;
      }
      span:first-child{
        color: #ffbf00;
      }
      span.-gte-half{
        color: #26C281;
      }
      span.sep{
        margin-left: 2px;
        margin-right: 2px;
      }
    }
  }
</style>