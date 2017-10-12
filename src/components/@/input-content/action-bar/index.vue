<template lang="jade">
  .action-bar
    c-picture
</template>


<script lang="coffee">
  module.exports =
    components:
      'c-picture': require('./picture')
</script>


<style lang="less" scoped>
  .action-bar{
  }
</style>