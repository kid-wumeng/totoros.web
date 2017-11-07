<template lang="jade">
  row.feed-item-simple
    .left
      user-face(:user="feed.user")
    .right.box-frame.-outset
      c-desc(:feed="feed")
      c-body(:feed="feed")
</template>


<script lang="coffee">
  module.exports =
    components:
      'user-face': require('components/image/user-face')
      'c-desc':    require('./desc')
      'c-body':    require('./body')

    props:
      'feed':
        type: Object
        required: true
</script>


<style lang="less" scoped>
  .feed-item-simple{
    box-sizing: border-box;
    width: 100%;
    align-items: stretch;
    >.left{
      flex: none;
    }
    >.right{
      flex: auto;
      box-sizing: border-box;
      margin-left: 12px;
      padding: 8px;
      position: relative;
      &::before{
        content: " ";
        border-width: 8px;
        border-right-color: #d1d5da;
        position: absolute;
        top: 8px;
        right: 100%;
        left: -10px;
        display: block;
        width: 0;
        height: 0;
        border-style: solid;
        border-width: 8px 10px 8px 0;
        border-color: transparent #EEE transparent transparent;
      }
      &::after{
        content: " ";
        margin-top: 1px;
        margin-left: 2px;
        border-width: 7px;
        border-right-color: #d1d5da;
        position: absolute;
        top: 8px;
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
    .user-face{
      flex: none;
      width: 36px;
    }
    .user-name{
      display: inline;
      font-size: 12px;
    }
  }
</style>