<template lang="jade">
  .detail-area
    .title.-noSmoothing {{ title }}
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
      font-size: 14px;
      color: #262626;
      opacity: 0.8;
      margin-bottom: 24px;
    }
  }
</style>