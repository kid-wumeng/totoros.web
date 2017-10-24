<template lang="jade">
  .right
    record(v-for="(record, index) in records", :key="index", :record="record")
</template>


<script lang="coffee">
  module.exports =
    components:
      'record': require('./record')

    computed:
      subject: -> @state['edit-subject-casts-modal'].subject
      records: -> @state['edit-subject-casts-modal'].records
</script>


<style lang="less" scoped>
  .right{
    box-sizing: border-box;
    width: 600px;
    height: 100%;
    overflow: scroll;
  }
</style>