<template lang="jade">
  .list
    item(v-for="(cast, index) in casts", :key="index", :cast="cast")
</template>


<script lang="coffee">
  module.exports =
    components:
      'item': require('./item')

    props:
      'casts':
        type: Array
        default: -> []
</script>


<style lang="less" scoped>
  .list{
  }
</style>
