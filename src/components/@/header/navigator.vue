<template lang="jade">
  .navigator
    router-link(to="/")        TIME-LINE
    router-link(to="/clubs/1") 讨论版
    router-link(to="/wiki")    维基计划
</template>


<script lang="coffee">
  module.exports =
    data: -> {}
</script>


<style lang="less" scoped>
  .navigator{
    margin-left: 16px;
    font-weight: 600;
    a{
      font-size: 14px;
      margin-left: 16px;
    }
  }
</style>
