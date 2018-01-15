<template lang="jade">
  #marks
    c-base
    feed-list(:feeds="feeds")
    more-button(:has-more-page="model.assets.hasMorePage(page, size, total)", @click="more")
</template>


<script lang="coffee">
  module.exports =
    components:
      'c-base':      require('./base')
      'feed-list':   require('./feed-list')
      'more-button': require('components.h5/more-button')

    data: ->
      forum: null
      feeds: []
      page: 0
      size: 20
      total: 0

    activated: ->
      @init()

    methods:
      init: ->
        @page = 0
        @more()

      more: ->
        @page += 1
        result = await api.call('feed.getAll', {
          types: ['create-post', 'update-post']
          page: @page
          size: @size
        })
        @feeds = @feeds.concat(result.feeds)
        @total = result.total
</script>


<style lang="less" scoped>
  #marks{
  }
</style>