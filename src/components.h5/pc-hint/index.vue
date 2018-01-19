<template lang="jade">
  .pc-hint 暂时只有电脑端可以登录、发帖、标记，网址：totoros.cc
</template>


<script lang="coffee">
  module.exports =
    components:
      'cdn-image': require('components/image/cdn-image')
</script>


<style lang="less">
  .pc-hint{
    box-sizing: border-box;
    width: 100%;
    padding: 8px 20px;
    font-weight: 500;
    font-size: 11px;
    color: #A2AEBA;
    background-color: rgb(249, 249, 249);
  }
</style>