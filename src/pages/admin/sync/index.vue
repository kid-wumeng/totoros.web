<template lang="jade">
  #admin-forums
    action-bar
    progress-modal
</template>


<script lang="coffee">
  module.exports =
    components:
      'action-bar':     require('./action-bar')
      'progress-modal': require('./progress-modal')
</script>


<style lang="less" scoped>
  #admin-forums{
  }
</style>
