<template lang="jade">
  radio(:label="radio.label", :value="radio.value")
</template>


<script lang="coffee">
  module.exports =
    components:
      'radio': require('components/@/radio')

    props:
      'label':
        type: String
        required: true
      'value':
        type: String
        required: true
</script>


<style lang="less" scoped>
  .mark-type-radio-bar{
    .radio{
      padding: 0 20px;
      height: 30px;
      border: none !important;
    }
  }
</style>
