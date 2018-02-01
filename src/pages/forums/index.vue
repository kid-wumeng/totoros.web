<template lang="jade">
  #forums(v-if="forum")
    c-head(:forum="forum")
    router-view(:forum="forum", :posts="posts", :size="size", :total="total")
</template>


<script lang="coffee">
  module.exports =
    components:
      'c-head': require('./head')

    data: ->
      forum: null
      posts: []
      size:  50
      total: 0

    computed:
      forumID: -> parseInt(if @routeID then @routeID else 2)

    created: ->
      @listen('CREATE_POST', @createPost)

    activated: ->
      @init()

    methods:
      init: ->
        @forum = await api.call('forum.get', @forumID, {open: true})
        { posts, total } = await api.call('post.getAll', {
          fid:  @forumID
          page: @routePage
          size: @size
        })

        if(@routePage is 1)
          topResult = await api.call('post.getAll', {top: true})
          posts = topResult.posts.concat(posts)

        @posts = posts
        @total = total

      createPost: (post) ->
        if(post.forum.id is @forumID)
          index = 0
          for p, i in @posts
            if(!p.top)
              index = i
              break
          @posts.splice(index, 0, post)
</script>


<style lang="less" scoped>
  #forums{
  }
</style>