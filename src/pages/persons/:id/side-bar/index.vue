<template lang="jade">
  .side-bar
    edit(:person="person")
</template>


<script lang="coffee">
  module.exports =
    components:
      'edit': require('./edit')

    props:
      'person':
        type: Object
        required: true
</script>


<style lang="less" scoped>
  .side-bar{
    >*{
      margin-bottom: 20px;
      &:last-child{
        margin-bottom: 0;
      }
    }
  }
</style>