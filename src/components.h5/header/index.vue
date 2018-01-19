<template lang="jade">
  row.header.-between.-center
    .left
      cdn-image.logo(path="assets/logo?2017-11-09" @click="$router.push('/')")
    row.right.-right.-center
      .item(:class="{'-active': $route.path === '/'}" @click="$router.push('/')") 讨论版
      .item(:class="{'-active': $route.path === '/marks'}" @click="$router.push('/marks')") MARKS
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
    padding-right: 20px;
    width: 100%;
    height: 48px;
    background-color: #FFF;
    >.left{
      >.logo{
        @width: 76px;
        width: @width;
        height: @width / 5;
      }
    }
    >.right{
      >.item{
        padding: 0 16px;
        height: 48px;
        line-height: 48px;
        text-align: center;
        font-size: 15px;
        font-weight: 500;
        color: #A2AEBA;
      }
      >.item.-active{
        color: #273340;
      }
    }
  }
</style>