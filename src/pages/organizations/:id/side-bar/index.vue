<template lang="jade">
  .side-bar
    edit(:organization="organization")
</template>


<script lang="coffee">
  module.exports =
    components:
      'edit': require('./edit')

    props:
      'organization':
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