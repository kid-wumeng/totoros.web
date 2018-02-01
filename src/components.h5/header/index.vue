<template lang="jade">
  row.header.-between.-center
    row.left.-center
      cdn-image.logo(path="assets/logo?2018-02-01" @click="$router.push('/')")
    row.right.-right.-center
      .item(:class="{'-active': activeBBS()}" @click="$router.push('/')") 讨论版
      .item(:class="{'-active': $route.path === '/marks'}" @click="$router.push('/marks')") MARKS
</template>


<script lang="coffee">
  module.exports =
    components:
      'cdn-image': require('components/image/cdn-image')

    methods:
      activeBBS: ->
        return @$route.path is '/' or /^\/forums/.test(@$route.path)
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
        @width: 96px;
        width: @width;
        height: @width / 7.4875;
      }
    }
    >.right{
      >.item{
        padding: 0 16px;
        height: 48px;
        line-height: 48px;
        text-align: center;
        font-size: 15px;
        font-weight: 600;
        color: #A2AEBA;
      }
      >.item.-active{
        color: #445669;
      }
    }
  }
</style>