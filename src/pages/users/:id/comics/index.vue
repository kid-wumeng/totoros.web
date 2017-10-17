<template lang="jade">
  #user-detail-comics comics
</template>


<script lang="coffee">
  module.exports =
    props:
      'user':
        type: Object
        required: true
</script>


<style lang="less" scoped>
  #user-detail-comics{
  }
</style>