<template lang="jade">
  .detail-box
    .title {{ title }}
    .content
      slot
</template>


<script lang="coffee">
  module.exports =
    components:
      'c-line': require('components/@/line')

    props:
      'title':
        type: String
        default: ''
</script>


<style lang="less">
  .detail-box{
    >.title{
      text-align: center;
      font-size: 13px;
      font-weight: 600;
    }
    >.content{
      margin-top: 7px;
      box-sizing: border-box;
      padding: 12px 12px;
      border: 1px solid #F2F2F2;
      border-radius: 3px;
    }
  }
</style>