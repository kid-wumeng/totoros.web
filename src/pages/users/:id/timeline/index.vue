<template lang="jade">
  #user-detail-timeline timeline
</template>


<script lang="coffee">
  module.exports =
    props:
      'user':
        type: Object
        required: true
</script>


<style lang="less" scoped>
  #user-detail-timeline{
  }
</style>