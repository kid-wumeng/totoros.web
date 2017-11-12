<template lang="jade">
  .navigator
    router-link(:class="{'-active': $route.path === '/'}" to="/") TIME-LINE
    router-link(:class="{'-active': isforum}" to="/forums/2") 讨论版
    //- router-link(:class="{'-active': $route.path === '/wiki'}" to="/wiki") 维基计划
</template>


<script lang="coffee">
  module.exports =
    computed:
      isforum: ->
        return /^\/forums\//.test(@$route.path)
</script>


<style lang="less" scoped>
  .navigator{
    margin-left: 44px;
    a{
      display: inline-block;
      height: 64px;
      line-height: 64px;
      padding: 0 10px;
      font-size: 14px;
      font-weight: 600;
      color: #445669;
    }
    a.-active{
    }
  }
</style>
