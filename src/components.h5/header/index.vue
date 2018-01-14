<template lang="jade">
  row.header.-between.-center
    .left
      cdn-image.logo(path="assets/logo?2017-11-09")
    row.right.-right.-center
      .item(@click="$router.push('/')") 讨论版
      .item(@click="$router.push('/marks')") MARKS
</template>


<script lang="coffee">
  module.exports =
    components:
      'cdn-image': require('components/image/cdn-image')
</script>


<style lang="less">
  .header{
    box-sizing: border-box;
    padding: 0 32px;
    width: 100%;
    height: 48px;
    border-bottom: 1px solid rgb(245, 245, 245);
    >.left{
      >.logo{
        @width: 72px;
        width: @width;
        height: @width / 5;
        opacity: 0.9;
      }
    }
    >.right{
      >.item{
        text-align: center;
        font-size: 14px;
        font-weight: 600;
        margin-left: 32px;
      }
    }
  }
</style>