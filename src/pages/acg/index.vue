<template lang="jade">
  #acg
    top-bar(active="acg")
</template>


<script lang="coffee">
  module.exports =
    components:
      'top-bar': require('components/bbs/top-bar')
</script>


<style lang="less" scoped>
  #acg{
  }
</style>
