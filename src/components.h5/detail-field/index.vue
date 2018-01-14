<template lang="jade">
  row.detail-field
    .label {{ displayLabel }}
    .value: slot
</template>


<script lang="coffee">
  module.exports =
    props:
      'label':
        type: String
        default: ''

    computed:
      displayLabel: ->
        label = @label
        count = 4 - label.length
        while count > 0
          label = '　' + label
          count--
        return label
</script>


<style lang="less">
  .detail-field{
    margin-bottom: 8px;
    &:last-child{
      margin-bottom: 0;
    }
    >.label{
      flex: none;
      font-size: 13px;
      font-weight: 600;
    }
    >.value{
      font-size: 13px;
      margin-left: 8px;
      color: #707C88;
      *{
        display: inline;
        color: #707C88;
      }
    }
  }
</style>