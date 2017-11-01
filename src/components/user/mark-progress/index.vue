<template lang="jade">
  .mark-progress
    .progress-bar
      .active(:style="activeStyle")
    .number
      span {{ progress }}
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

      activeStyle: ->
        if @episodeCount
          return width: "#{@progress/@episodeCount*100}%"
        else
          return width: 0
</script>


<style lang="less" scoped>
  .mark-progress{
    box-sizing: border-box;
    width: 120px;
    .progress-bar{
      flex: auto;
      height: 10px;
      padding: 1px;
      background-color: rgba(247, 247, 247, 1);
      border: 1px solid rgb(240, 240, 240);
      border-radius: 2px;
      .active{
        height: 10px;
        background-image: linear-gradient(90deg, #66C277 0%, #16a085 90%);
        border-radius: 2px;
      }
    }
    .number{
      margin-top: 4px;
      text-align: right;
      opacity: 0.6;
      span{
        font-weight: 600;
        font-size: 20px;
        color: #A2AEBA;
      }
      span:first-child{
        color: #26C281;
      }
      span.sep{
        margin-left: 2px;
        margin-right: 2px;
      }
    }
  }
</style>