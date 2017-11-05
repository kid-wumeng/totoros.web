<template lang="jade">
  #clubs-detail(v-if="club")
    row.-between.-center
      c-base(:club="club")
      action-bar(:club="club")
    post-list(:posts="posts")
</template>


<script lang="coffee">
  module.exports =
    components:
      'c-base':     require('./base')
      'action-bar': require('./action-bar')
      'post-list':  require('./post-list')

    data: ->
      club:  null
      posts: []

    watch:
      routeID: -> @init()

    created: ->
      @listen('CREATE_POST', @createPost)

    methods:
      init: ->
        @club  = await api.call('club.get', @routeID)
        result = await api.call('post.getAll', {cid: @routeID})
        @posts = result.posts

      createPost: (post) ->
        @posts.unshift(post)
</script>


<style lang="less" scoped>
  #clubs-detail{
    overflow: hidden;
    margin: 0 auto;
    margin-top: 36px;
    width: 800px;
  }
</style>