<template lang="jade">
  #comics
    top-bar(active="comics")
</template>


<script lang="coffee">
  module.exports =
    components:
      'top-bar': require('components/bbs/TopBar')
</script>


<style lang="less" scoped>
  #comics{
  }
</style>
