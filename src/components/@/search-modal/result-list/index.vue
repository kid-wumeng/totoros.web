<template lang="jade">
  .result-list
    item(v-for="result in results", :key="result.id", :result="result")
</template>


<script lang="coffee">
  module.exports =
    components:
      'item': require('./item')

    computed:
      type:    -> @state['search-modal'].type
      results: -> @state['search-modal'].results
</script>


<style lang="less" scoped>
  .result-list{
    flex: auto;
    box-sizing: border-box;
    width: 100%;
    overflow: scroll;
  }
</style>