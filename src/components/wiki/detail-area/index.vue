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


<style lang="less">
  .detail-area{
    >.title{
      text-align: right;
      font-size: 13px;
      font-weight: 600;
    }
    >.line{
      margin-top: 6px;
      margin-bottom: 6px;
      color: #EEE;
    }
  }
</style>