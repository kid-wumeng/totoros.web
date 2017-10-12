<template lang="jade">
  .right
    input-content-picture-manager
</template>


<script lang="coffee">
  module.exports =
    components:
      'input-content-picture-manager': require('components/@/input-content-picture-manager')
</script>


<style lang="less" scoped>
  .right{
    margin-left: 20px;
  }
</style>