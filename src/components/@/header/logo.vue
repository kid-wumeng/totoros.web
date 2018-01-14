<template lang="jade">
  .logo(@click="$router.push('/')")
    .wrap
      cdn-image(path="assets/logo?2017-11-09")
      .version 0.7 Beta
</template>


<script lang="coffee">
  module.exports =
    components:
      'cdn-image': require('components/image/cdn-image')
</script>


<style lang="less" scoped>
  .logo{
    @width: 76px;
    position: relative;
    top: -2px;
    height: 64px;
    line-height: 64px;
    cursor: pointer;
    position: relative;
    display: flex;
    align-items: center;
    .cdn-image{
      width: @width;
      height: @width / 5.5125;
      opacity: 0.9;
    }
    .version{
      position: absolute;
      right: -20px;
      bottom: -16px;
      font-size: 12px;
      color: #A2AEBA;
      transform: scale3d(0.85, 0.85, 1);
    }
  }
</style>
