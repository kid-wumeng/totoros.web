<template lang="jade">
  .edit-item.row.-top
    .left
      .label {{ label }}
    .right
      slot
      .hint {{ hint }}
</template>


<script lang="coffee">
  module.exports =
    props:
      'label':
        type: String
        default: ''
      'hint':
        type: String
        default: ''
</script>


<style lang="less">
  .edit-item{
    .left{
      flex: none;
      .label{
        width: 100px;
        text-align: right;
        height: 34px;
        line-height: 33px;
        font-weight: 500;
        font-size: 14px;
      }
    }
    .right{
      margin-left: 12px;
      flex: auto;
    }
  }
</style>
