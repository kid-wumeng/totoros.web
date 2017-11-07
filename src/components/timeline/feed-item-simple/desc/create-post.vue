<template lang="jade">
  .create-post
    span 发了贴
</template>


<script lang="coffee">
  module.exports =
    props:
      'feed':
        type: Object
        required: true
</script>


<style lang="less" scoped>
  .create-post{
    span{
      word-break: break-all;
      font-weight: 500;
      font-size: 12px;
      color: #A2AEBA;
    }
  }
</style>