<template lang="jade">
  row.desc-card
    .left
      slot(name="face")
    .right
      .name {{ name }}
      text-area.desc(:text="desc")
</template>


<script lang="coffee">
  module.exports =
    components:
      'text-area': require('components/@/text-area')

    props:
      'name':
        type: String
        default: ''
      'desc':
        type: String
        default: ''
</script>


<style lang="less" scoped>
  .desc-card{
    .left > *{
      width: 72px;
    }
    .right{
      margin-left: 12px;
    }
    .name{
      font-weight: 600;
      font-size: 16px;
      color: #273340;
    }
    .desc{
      margin-top: 5px;
      line-height: 20px;
      font-size: 13px;
      color: #707C88;
    }
  }
</style>