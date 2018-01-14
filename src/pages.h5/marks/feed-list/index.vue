<template lang="jade">
  .feed-list
    item(v-for="feed in feeds", :key="feed.id", :feed="feed")
</template>


<script lang="coffee">
  module.exports =
    components:
      'item': require('./item')

    props:
      'feeds':
        type: Array
        default: -> []
</script>


<style lang="less" scoped>
  .feed-list{
    box-sizing: border-box;
    .item{
      margin-bottom: 20px;
      &:last-child{
        margin-bottom: 0;
      }
    }
  }
</style>