<template lang="jade">
  .by1
    c-picture(:picture="pictures[0]")
</template>


<script lang="coffee">
  module.exports =
    components:
      'c-picture': require('components/image/picture')

    props:
      'pictures':
        type: Array
        required: true
</script>


<style lang="less" scoped>
  .by1{
    .picture{
      width: 100%;
      justify-content: flex-start;
    }
  }
</style>