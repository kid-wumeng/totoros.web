<template lang="jade">
  .detail-area
    .title {{ title }}
    c-line
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


<style lang="less" scoped>
  .detail-area{
    >.title{
      text-align: right;
      font-size: 14px;
      font-weight: 600;
      color: #A2AEBA;
    }
    >.line{
      margin-top: 7px;
      margin-bottom: 7px;
    }
  }
</style>