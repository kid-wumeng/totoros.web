<template lang="jade">
  #paints
    top-bar(active="paints")
</template>


<script lang="coffee">
  module.exports =
    components:
      'top-bar': require('components/bbs/top-bar')
</script>


<style lang="less" scoped>
  #paints{
  }
</style>
