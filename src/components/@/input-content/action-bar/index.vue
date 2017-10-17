<template lang="jade">
  .action-bar.row.-left
    action-picture
    action-video
    action-subject
    action-role
    action-person
    action-organization
</template>


<script lang="coffee">
  module.exports =
    components:
      'action-picture':      require('./action-picture')
      'action-video':        require('./action-video')
      'action-subject':      require('./action-subject')
      'action-role':         require('./action-role')
      'action-person':       require('./action-person')
      'action-organization': require('./action-organization')
</script>


<style lang="less" scoped>
  .action-bar{
  }
</style>