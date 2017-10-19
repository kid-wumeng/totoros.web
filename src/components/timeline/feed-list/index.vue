<template lang="jade">
  .feed-list
    feed-item(v-for="feed in feeds", :key="feed.id", :feed="feed")
</template>


<script lang="coffee">
  module.exports =
    components:
      'feed-item': require('components/timeline/feed-item')

    props:
      'feeds':
        type: Array
        default: -> []
</script>


<style lang="less" scoped>
  .feed-list{
    width: 100%;
    .feed-item{
      margin-bottom: 32px;
      &:last-child{
        margin-bottom: 0;
      }
    }
  }
</style>