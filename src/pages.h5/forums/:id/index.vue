<template lang="jade">
  #forums-detail
    .wrap
      post-list(:posts="posts")
      more-button(:has-more-page="model.assets.hasMorePage(page, size, total)", @click="$emit('more')")
</template>


<script lang="coffee">
  module.exports =
    components:
      'post-list':   require('./post-list')
      'more-button': require('components.h5/more-button')

    props:
      'forum':
        type: Object
        required: true

    data: ->
      posts: []
      page:  0
      size:  50
      total: 0

    created: ->
      @listen('CREATE_POST', @createPost)

    created: ->
      @init()

    activated: ->
      @init()

    methods:
      init: ->
        result = await api.call('post.getAll', {top: true})
        @page  = 0
        @more(result.posts)

      more: (topPosts=[]) ->
        @page += 1
        result = await api.call('post.getAll', {
          fid:  @forum.id
          page: @page
          size: @size
        })
        @posts = topPosts.concat(result.posts)
        @total = result.total

      createPost: (post) ->
        if(post.forum.id is @forum.id)
          index = 0
          for p, i in @posts
            if(!p.top)
              index = i
              break
          @posts.splice(index, 0, post)
</script>


<style lang="less" scoped>
  #forums-detail{
    .wrap{
      box-sizing: border-box;
      width: 100%;
    }
  }
</style>