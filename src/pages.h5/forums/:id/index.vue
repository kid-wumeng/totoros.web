<template lang="jade">
  #forums-detail(v-if="forum")
    .wrap
      c-base(:forum="forum")
      post-list(:posts="posts")
      more-button(:has-more-page="model.assets.hasMorePage(page, size, total)", @click="more")
</template>


<script lang="coffee">
  module.exports =
    components:
      'c-base':      require('./base')
      'post-list':   require('./post-list')
      'more-button': require('components.h5/more-button')

    data: ->
      forum: null
      posts: []
      page: 0
      size: 30
      total: 0

    activated: ->
      @init()

    methods:
      init: ->
        @forum = await api.call('forum.get', 1, {open: true})
        result = await api.call('post.getAll', {top: true})
        @posts = result.posts
        @page  = 0
        @more()

      more: ->
        @page += 1
        result = await api.call('post.getAll', {
          fid:  1
          page: @page
          size: @size
        })
        @posts = @posts.concat(result.posts)
        @total = result.total
</script>


<style lang="less" scoped>
  #forums-detail{
    .wrap{
      box-sizing: border-box;
      width: 100%;
    }
  }
</style>