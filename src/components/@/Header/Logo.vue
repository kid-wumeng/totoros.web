<template lang="jade">
  c-image.logo(url="assets/logo?2017-10-01.9", @click.native="$router.push('/')")
</template>


<script lang="coffee">
  module.exports =
    components:
      'c-image': require('components/image/Image')
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
