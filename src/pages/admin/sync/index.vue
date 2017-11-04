<template lang="jade">
  #admin-clubs
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
  #admin-clubs{
  }
</style>
