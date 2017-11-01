<template lang="jade">
  cdn-image.logo(path="assets/logo?2017-10-31", @click.native="$router.push('/')")
</template>


<script lang="coffee">
  module.exports =
    components:
      'cdn-image': require('components/image/cdn-image')
</script>


<style lang="less" scoped>
  .logo{
    @width: 115px;
    width: @width;
    height: @width / 3.44;
    position: relative;
    top: -3px;
    cursor: pointer;
  }
</style>
