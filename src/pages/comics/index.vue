<template lang="jade">
  #comics
    top-bar(active="comics")
</template>


<script lang="coffee">
  module.exports =
    components:
      'top-bar': require('components/bbs/top-bar')
</script>


<style lang="less" scoped>
  #comics{
  }
</style>
