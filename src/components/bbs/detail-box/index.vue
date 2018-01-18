<template lang="jade">
  .bbs-detail-box
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
  .bbs-detail-box{
    >.title{
      text-align: center;
      font-size: 14px;
      font-weight: 600;
      color: #A2AEBA;
    }
    >.content{
      box-sizing: border-box;
      overflow: hidden;
    }
  }
</style>