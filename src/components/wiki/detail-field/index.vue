<template lang="jade">
  .detail-field
    .label {{ label }}
    .value: slot
</template>


<script lang="coffee">
  module.exports =
    props:
      'label':
        type: String
        default: ''
</script>


<style lang="less">
  .detail-field{
    margin-bottom: 8px;
    &:last-child{
      margin-bottom: 0;
    }
    >.label{
      display: inline;
      font-size: 13px;
      font-weight: 600;
    }
    >.value{
      display: inline;
      font-size: 13px;
      margin-left: 5px;
      color: #707C88;
      *{
        display: inline;
        color: #707C88;
      }
    }
  }
</style>