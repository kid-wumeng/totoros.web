<template lang="jade">
  #user-detail-games games
</template>


<script lang="coffee">
  module.exports =
    props:
      'user':
        type: Object
        required: true
</script>


<style lang="less" scoped>
  #user-detail-games{
  }
</style>