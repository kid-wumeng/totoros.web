<template lang="jade">
  #animes
    top-bar(active="animes")
</template>


<script lang="coffee">
  module.exports =
    components:
      'top-bar': require('components/bbs/TopBar')
</script>


<style lang="less" scoped>
  #animes{
  }
</style>
