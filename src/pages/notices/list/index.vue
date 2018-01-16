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
      padding-bottom: 28px;
      border-bottom: 1px solid #F2F2F2;
      margin-bottom: 28px;
    }
  }
</style>
