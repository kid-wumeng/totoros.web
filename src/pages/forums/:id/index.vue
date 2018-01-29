<template lang="jade">
  #forums-detail(v-if="forum")
    .wrap
      row.-between.-center
        c-base(:forum="forum")
        action-bar(:forum="forum")
      post-list(:posts="posts")
      page-bar(:page="routePage", :size="size", :total="total" @change="changePage")

    post-modal
</template>


<script lang="coffee">
  module.exports =
    components:
      'c-base':     require('./base')
      'action-bar': require('./action-bar')
      'post-list':  require('./post-list')
      'page-bar':   require('components/@/page-bar')
      'post-modal': require('components/bbs/post-modal')

    data: ->
      forum: null
      posts: []
      size:  50
      total: 0

    metaInfo: ->
      title: '硬核漫画'

    # watch:
    #   routeID:   -> @init()
    #   routePage: -> @init()

    created: ->
      @listen('CREATE_POST', @createPost)

    activated: ->
      @init()

    methods:
      init: ->
        @forum = await api.call('forum.get', 1, {open: true})
        { posts, total } = await api.call('post.getAll', {
          fid:  1
          page: @routePage
          size: @size
        })

        if(@routePage is 1)
          topResult = await api.call('post.getAll', {top: true})
          posts = topResult.posts.concat(posts)

        @posts = posts
        @total = total

      changePage: (page) ->
        @$router.push("##{page}")

      createPost: (post) ->
        @posts.unshift(post)
</script>


<style lang="less" scoped>
  #forums-detail{
    .wrap{
      overflow: hidden;
      margin: 0 auto;
      padding-top: 30px;
      padding-bottom: 30px;
      width: 800px;
      .page-bar{
        margin-top: 20px;
      }
    }
  }
</style>