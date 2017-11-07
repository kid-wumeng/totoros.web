<template lang="jade">
  .navigator
    router-link(:class="{'-active': $route.path === '/'}" to="/")         TIME-LINE
    router-link(:class="{'-active': isClub}" to="/clubs/2")               讨论版
    router-link(:class="{'-active': $route.path === '/wiki'}" to="/wiki") 维基计划
</template>


<script lang="coffee">
  module.exports =
    computed:
      isClub: ->
        return /^\/clubs\//.test(@$route.path)
</script>


<style lang="less" scoped>
  .navigator{
    margin-left: 16px;
    a{
      margin-left: 16px;
      font-weight: 600;
      font-size: 14px;
      color: #AAA;
    }
    a.-active{
      color: #445669;
    }
  }
</style>
