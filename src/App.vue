<template lang="jade">
  #app
    c-header
    router-view.body
    .head 脚步

    totoro
    notify
    prompt
</template>


<script lang="coffee">
  module.exports =
    components:
      'c-header': require('components/@/header')
      'totoro':   require('components/@/totoro')
      'notify':   require('components/@/notify')
      'prompt':   require('components/@/prompt')
</script>


<style lang="less">
  @import '~assets/widgets';

  *{
    margin: 0;
    border: 0;
    padding: 0;
    font-family: "Lato", "Helvetica Neue", "PingFang SC", "Hiragino Sans GB", "Microsoft YaHei", "微软雅黑", Arial, sans-serif;
    font-size: 14px;
    color: #445669;
    -webkit-tap-highlight-color: transparent;
  }

  a{
    text-decoration: none;
  }

  .icon{
    font: normal normal normal 14px/1 FontAwesome;
    font-size: inherit;
    text-rendering: auto;
    -webkit-font-smoothing: antialiased;
    -moz-osx-font-smoothing: grayscale;
  }

  html{
    height: 100%;
    -webkit-font-smoothing: antialiased;
    -moz-osx-font-smoothing: grayscale;
  }

  body{
    height: 100%;
    background-color: rgba(250, 250, 250, 0.93);
  }

  #app{
    height: 100%;
    overflow: scroll;
    display: flex;
    flex-direction: column;
    align-items: center;
    .body{
      flex: auto;
      width: 100%;
    }
  }
</style>
