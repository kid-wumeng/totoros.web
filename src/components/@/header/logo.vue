<template lang="jade">
  router-link.logo(to="/")
    .wrap
      cdn-image(path="assets/logo?2018-02-01")
      //- .version 硬核漫画 0.7.2
</template>


<script lang="coffee">
  module.exports =
    components:
      'cdn-image': require('components/image/cdn-image')
</script>


<style lang="less" scoped>
  .logo{
    @width: 100px;
    position: relative;
    top: -1px;
    height: 64px;
    line-height: 64px;
    cursor: pointer;
    position: relative;
    display: flex;
    align-items: center;
    .cdn-image{
      width: @width;
      height: @width / 7.4875;
    }
    .version{
      position: absolute;
      right: -32px;
      bottom: -16px;
      font-size: 12px;
      color: #A2AEBA;
      transform: scale3d(0.85, 0.85, 1);
    }
  }
</style>
