<template lang="jade">
  .base
    .name {{ user.name }}
    .motto {{ user.motto }}
</template>


<script lang="coffee">
  module.exports =
    props:
      'user':
        type: Object
        required: true
</script>


<style lang="less" scoped>
  .base{
    box-sizing: border-box;
    .name{
      font-weight: 600;
      font-size: 16px;
    }
    .motto{
      margin-top: 5px;
      font-size: 13px;
      color: #707C88;
    }
  }
</style>