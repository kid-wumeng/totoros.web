<template lang="jade">
  .navigator
    router-link(:class="{'-active': isForum}" to="/forums/2") 讨论版
    //- router-link(:class="{'-active': $route.path === '/wiki'}" to="/wiki") 维基计划
    router-link(:class="{'-active': $route.path === '/marks'}" to="/marks") MARKS
</template>


<script lang="coffee">
  module.exports =
    computed:
      isForum: ->
        return /^\/forums\//.test(@$route.path)
</script>


<style lang="less" scoped>
  .navigator{
    margin-left: 44px;
    a{
      display: inline-block;
      height: 64px;
      line-height: 64px;
      padding: 0 16px;
      font-size: 14px;
      font-weight: 600;
      color: #445669;
    }
    a.-active{
    }
  }
</style>
