<template lang="jade">
  #user-detail-blogs blogs
</template>


<script lang="coffee">
  module.exports =
    props:
      'user':
        type: Object
        required: true
</script>


<style lang="less" scoped>
  #user-detail-blogs{
  }
</style>