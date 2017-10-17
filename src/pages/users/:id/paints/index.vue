<template lang="jade">
  #user-detail-paints paints
</template>


<script lang="coffee">
  module.exports =
    props:
      'user':
        type: Object
        required: true
</script>


<style lang="less" scoped>
  #user-detail-paints{
  }
</style>