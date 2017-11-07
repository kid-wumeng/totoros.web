<template lang="jade">
  #clubs-detail(v-if="club")
    row.-between.-center
      c-base(:club="club")
      action-bar(:club="club")
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
      club:  null
      posts: []
      total: 0

    watch:
      routeID:   -> @init()
      routePage: -> @init()

    created: ->
      @listen('CREATE_POST', @createPost)

    methods:
      init: ->
        @club  = await api.call('club.get', @routeID, {open: true})
        result = await api.call('post.getAll', {
          cid:  @routeID
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
  #clubs-detail{
    overflow: hidden;
    margin: 0 auto;
    margin-top: 24px;
    width: 800px;
  }
</style>