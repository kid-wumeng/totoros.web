<template lang="jade">
  cdn-image.logo(path="assets/logo?2017-11-05.2", @click.native="$router.push('/')")
</template>


<script lang="coffee">
  module.exports =
    components:
      'cdn-image': require('components/image/cdn-image')
</script>


<style lang="less" scoped>
  .logo{
    @width: 86px;
    width: @width;
    height: @width / 4.54;
    position: relative;
    top: -2px;
    cursor: pointer;
  }
</style>
