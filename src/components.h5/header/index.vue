<template lang="jade">
  row.header.-between.-center
    .left
      cdn-image.logo(path="assets/logo?2017-11-09" @click="$router.push('/')")
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
    padding-left: 20px;
    padding-right: 32px;
    width: 100%;
    height: 48px;
    background-color: #FFF;
    border-bottom: 1px solid rgb(245, 245, 245);
    >.left{
      >.logo{
        @width: 76px;
        width: @width;
        height: @width / 5;
      }
    }
    >.right{
      >.item{
        text-align: center;
        font-size: 15px;
        font-weight: 500;
        margin-left: 32px;
      }
    }
  }
</style>