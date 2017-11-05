<template lang="jade">
  .feed-item.row.-left.-top
    .left
      face(:feed="feed")
    .right.box-frame.-outset
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
      margin-left: 16px;
      background-color: #FFF;
      border-top: 1px solid #FFF;
      position: relative;
      &::before{
        content: " ";
        border-width: 8px;
        border-right-color: #d1d5da;
        position: absolute;
        top: 11px;
        right: 100%;
        left: -10px;
        display: block;
        width: 0;
        height: 0;
        border-style: solid;
        border-width: 8px 10px 8px 0;
        border-color: transparent #E6E6E6 transparent transparent;
      }
      &::after{
        content: " ";
        margin-top: 1px;
        margin-left: 2px;
        border-width: 7px;
        border-right-color: #d1d5da;
        position: absolute;
        top: 11px;
        right: 100%;
        left: -10px;
        display: block;
        width: 0;
        height: 0;
        border-style: solid;
        border-width: 7px 8px 7px 0;
        border-color: transparent rgba(250, 250, 250, 1) transparent transparent;
      }
    }
    .head{
      background-color: rgba(250, 250, 250, 1);
    }
  }
</style>