<template lang="jade">
  #clubs-detail.box-frame(v-if="club")
    action-bar(:club="club")
    post-list(:posts="posts")
</template>


<script lang="coffee">
  module.exports =
    components:
      'action-bar': require('./action-bar')
      'post-list':  require('./post-list')

    data: ->
      club:  null
      posts: []

    created: ->
      @listen('CREATE_POST', @createPost)

    watch:
      'routeID': -> @init()

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
    margin: 20px auto;
    width: 800px;
    background-color: #FFF;
  }
</style>