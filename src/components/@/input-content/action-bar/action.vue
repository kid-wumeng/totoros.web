<template lang="jade">
  .action
    slot
</template>


<script lang="coffee">
  module.exports =
    props:
      ''
</script>


<style lang="less" scoped>
  .action{
    padding: 0 13px;
    text-align: center;
    border-radius: 3px;
    user-select: none;
    cursor: pointer;
    .icon{
      height: 16px;
      font-size: 14px;
      font-weight: 600;
    }
    .label{
      margin-top: 2px;
      height: 16px;
      line-height: 16px;
      font-size: 12px;
      font-weight: 600;
    }
  }
</style>