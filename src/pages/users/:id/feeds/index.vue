<template lang="jade">
  #user-detail-feeds
    feed-list(:feeds="feeds")
    page-bar(:page="routePage", :size="size", :total="total", @change="change")
</template>


<script lang="coffee">
  module.exports =
    components:
      'feed-list': require('components/timeline/feed-list')
      'page-bar':  require('components/@/page-bar')

    props:
      'user':
        type: Object
        required: true

    data: ->
      feeds: []
      size:  0
      total: 0

    watch:
      'routePage': -> @init()

    methods:
      init: ->
        result = await api.call('feed.getAllByUser', @user.id, {
          page: @routePage
        })
        @feeds = result.feeds
        @size  = result.size
        @total = result.total

      change: (page) ->
        @$router.push({
          hash: "##{page}"
        })
</script>


<style lang="less" scoped>
  #user-detail-feeds{
    .feed-list{
      width: 720px;
    }
    .page-bar{
      margin-top: 48px;
    }
  }
</style>