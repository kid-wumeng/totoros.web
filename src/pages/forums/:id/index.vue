<template lang="jade">
  #forums-detail(v-if="forum")
    row.-between.-center
      c-base(:forum="forum")
      action-bar(:forum="forum")
    post-list(:posts="posts")
    page-bar(:page="routePage", :size="30", :total="total" @change="changePage")
</template>


<script lang="coffee">
  module.exports =
    components:
      'c-base':     require('./base')
      'action-bar': require('./action-bar')
      'post-list':  require('./post-list')
      'page-bar':   require('components/@/page-bar')

    data: ->
      forum:  null
      posts: []
      total: 0

    watch:
      routeID:   -> @init()
      routePage: -> @init()

    created: ->
      @listen('CREATE_POST', @createPost)

    methods:
      init: ->
        @forum  = await api.call('forum.get', 1, {open: true})
        result = await api.call('post.getAll', {
          fid:  1
          page: @routePage
        })
        @posts = result.posts
        @total = result.total

      changePage: (page) ->
        @$router.push("##{page}")

      createPost: (post) ->
        @posts.unshift(post)
</script>


<style lang="less" scoped>
  #forums-detail{
    overflow: hidden;
    margin: 0 auto;
    margin-top: 30px;
    width: 750px;
  }
</style>