<template lang="jade">
  .mark-feeds
    detail-area(title="最近的标记")
      item(v-for="feed in feeds", :key="feed.id", :feed="feed")
</template>


<script lang="coffee">
  module.exports =
    components:
      'detail-area': require('components.h5/detail-area')
      'item':        require('./item')

    props:
      'user':
        type: Object
        required: true

    computed:
      feeds: ->
        feeds = @user.markFeeds ? []
        return feeds.slice(0, 10)
</script>


<style lang="less" scoped>
  .mark-feeds{
    .item{
      padding: 0 20px;
      padding-bottom: 8px;
      border-bottom: 1px dotted #F2F2F2;
      margin-bottom: 8px;
    }
    .item:first-child{
      margin-top: 12px;
    }
    .item:last-child{
      border-bottom: none;
      margin-bottom: 0;
    }
  }
</style>