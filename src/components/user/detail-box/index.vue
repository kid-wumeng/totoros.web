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
      font-size: 14px;
      font-weight: 600;
      color: #A2AEBA;
    }
    >.content{
      margin-top: 8px;
      box-sizing: border-box;
      border: 1px solid #F2F2F2;
      border-radius: 3px;
    }
  }
</style>