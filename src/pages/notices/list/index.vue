<template lang="jade">
  .list
    item(v-for="notice in notices", :key="notice.id", :notice="notice")
</template>


<script lang="coffee">
  module.exports =
    components:
      'item': require('./item')

    props:
      'notices':
        type: Array
        default: -> []
</script>


<style lang="less" scoped>
  .list{
    .item{
      border-bottom: 1px dashed #E4E8EB;
    }
  }
</style>
