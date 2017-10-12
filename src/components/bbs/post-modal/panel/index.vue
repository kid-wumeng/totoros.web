<template lang="jade">
  .panel.row.-top
    left
    right
</template>


<script lang="coffee">
  module.exports =
    components:
      'left':  require('./left')
      'right': require('./right')
</script>


<style lang="less" scoped>
  .panel{
  }
</style>