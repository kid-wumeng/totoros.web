<template lang="jade">
  .side-bar
    edit(:subject="subject")
    c-mark(v-if="state.account.checkined", :subject="subject")
</template>


<script lang="coffee">
  module.exports =
    components:
      'edit': require('./edit')
      'c-mark': require('./mark')

    props:
      'subject':
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