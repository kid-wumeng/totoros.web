<template lang="jade">
  row.feed-item
    .left
      face(:feed="feed")
    .right
      .wrap
        c-head(:feed="feed")
        c-body(:feed="feed")
        c-foot(:feed="feed")
</template>


<script lang="coffee">
  module.exports =
    components:
      'c-head': require('./head')
      'c-body': require('./body')
      'c-foot': require('./foot')
      'face':   require('./face')

    props:
      'feed':
        type: Object
        required: true
</script>


<style lang="less" scoped>
  .feed-item{
    box-sizing: border-box;
    width: 100%;
    >.right{
      flex: auto;
      box-sizing: border-box;
      margin-left: 18px;
      background-color: #FFF;
      border: 1px solid rgb(230, 230, 230);
      border-radius: 5px;
      box-shadow: 0 0 10px rgba(100, 100, 100, 0.1);
      position: relative;
      &::before{
        content: " ";
        border-width: 8px;
        border-right-color: #d1d5da;
        position: absolute;
        top: 12px;
        right: 100%;
        left: -10px;
        display: block;
        width: 0;
        height: 0;
        border-style: solid;
        border-width: 8px 10px 8px 0;
        border-color: transparent rgb(230, 230, 230) transparent transparent;
      }
      &::after{
        content: " ";
        margin-top: 1px;
        margin-left: 2px;
        border-width: 7px;
        border-right-color: #d1d5da;
        position: absolute;
        top: 12px;
        right: 100%;
        left: -10px;
        display: block;
        width: 0;
        height: 0;
        border-style: solid;
        border-width: 7px 8px 7px 0;
        border-color: transparent rgba(250, 250, 250, 1) transparent transparent;
      }
      .wrap{
        border-radius: 5px;
        overflow: hidden;
      }
    }
    .head{
      background-color: rgba(250, 250, 250, 1);
    }
  }
</style>