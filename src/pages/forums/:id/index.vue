<template lang="jade">
  #forum-detail
    action-bar(:forum="forum")
    post-list(:posts="posts")
    page-bar(:page="routePage", :size="size", :total="total" @change="changePage")
    post-modal
</template>


<script lang="coffee">
  module.exports =
    components:
      'page-bar':   require('components/@/page-bar')
      'post-modal': require('components/bbs/post-modal')
      'action-bar': require('./action-bar')
      'post-list':  require('./post-list')

    props:
      'forum':
        type: Object
        required: true

    data: ->
      posts: []
      size:  50
      total: 0

    created: ->
      @init()

    activated: ->
      @init()

    methods:
      init: ->
        result = await api.call('post.getAll', {
          fid:  @forum.id
          page: @routePage
          size: @size
        })
        @posts = result.posts
        @total = result.total

      createPost: (post) ->
        if(post.forum.id is @forum.id)
          index = 0
          for p, i in @posts
            if(!p.top)
              index = i
              break
          @posts.splice(index, 0, post)

      changePage: (page) ->
        @$router.push("##{page}")
</script>


<style lang="less" scoped>
  #forum-detail{
    margin: 0 auto;
    width: 800px;
    .page-bar{
      margin-top: 20px;
    }
  }
</style>