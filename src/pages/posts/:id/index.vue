<template lang="jade">
  #posts-id(v-if="post")
    .wrap
      breadcrumb(:post="post")
      c-main(:post="post")
      comment-list(:post="post", :comments="comments")
      input-comment(:post="post")
</template>


<script lang="coffee">
  module.exports =
    components:
      'breadcrumb':    require('./breadcrumb')
      'c-main':        require('./main')
      'comment-list':  require('./comment-list')
      'input-comment': require('./input-comment')

    computed:
      id:       -> parseInt(@$route.params.id)
      post:     -> @state['post-detail'].post
      comments: -> @state['post-detail'].comments

    created: ->
      @init()

    watch:
      'routePage': -> @init()

    methods:
      init: ->
        @dispatch('post-detail/loadPost', {id: @id})
        @dispatch('post-detail/loadComments', {id: @id, page: @routePage})
</script>


<style lang="less" scoped>
  #posts-id{
    background-color: #FFF;
    overflow: hidden;
    .wrap{
      margin: 20px auto;
      width: 700px;
      >*{
        margin-bottom: 20px;
      }
    }
  }
</style>
