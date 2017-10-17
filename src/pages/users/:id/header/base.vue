<template lang="jade">
  .base
    .name KID
    .motto 时の流れに身をまかせ
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
      margin-top: 3px;
      font-size: 13px;
      color: #707C88;
    }
  }
</style>