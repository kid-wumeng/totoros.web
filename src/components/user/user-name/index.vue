<template lang="jade">
  .user-name {{ user.name }}
</template>


<script lang="coffee">
  module.exports =
    props:
      'user':
        type: Object
        required: true
</script>


<style lang="less" scoped>
  .user-name{
    font-weight: 600;
    color: #2F9C95;
    cursor: pointer;
  }
</style>