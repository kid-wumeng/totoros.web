<template lang="jade">
  row.panel
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
    .left{
      padding-right: 32px;
      border-right: 1px solid #F2F2F2;
      margin-right: 30px;
    }
  }
</style>