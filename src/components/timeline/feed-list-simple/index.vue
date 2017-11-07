<template lang="jade">
  .feed-list-simple
    feed-item-simple(v-for="feed in feeds", :key="feed.id", :feed="feed")
</template>


<script lang="coffee">
  module.exports =
    components:
      'feed-item-simple': require('components/timeline/feed-item-simple')

    props:
      'feeds':
        type: Array
        default: -> []
</script>


<style lang="less" scoped>
  .feed-list-simple{
    .feed-item-simple{
      margin-bottom: 8px;
      &:last-child{
        margin-bottom: 0;
      }
    }
  }
</style>