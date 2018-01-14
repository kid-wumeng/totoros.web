<template lang="jade">
  .detail-area
    .title {{ title }}
    .wrap
      slot
</template>


<script lang="coffee">
  module.exports =
    props:
      'title':
        type: String
        default: ''
</script>


<style lang="less" scoped>
  .detail-area{
    .title{
      text-align: center;
      font-size: 13px;
      font-weight: 600;
      color: #A2AEBA;
      margin-bottom: 12px;
    }
  }
</style>