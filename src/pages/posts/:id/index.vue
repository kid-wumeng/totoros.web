<template lang="jade">
  #posts-id(v-if="post")
    row.wrap
      .left
        c-header(:post="post")
        c-content(:post="post")
        comment-list(:post="post")
        comment-form(:post="post")
      .right
        action-sheets(:post="post")
        relative-wiki(:post="post")

    reference-comment-modal
</template>


<script lang="coffee">
  module.exports =
    components:
      'c-header':      require('./header')
      'c-content':     require('./content')
      'comment-list':  require('./comment-list')
      'comment-form':  require('./comment-form')
      'action-sheets': require('./action-sheets')
      'relative-wiki': require('./relative-wiki')
      'reference-comment-modal': require('components/comment/reference-comment-modal')

    data: ->
      post: null

    created: ->
      @listen('UPDATE_POST', @updatePost)

    activated: ->
      @init()

    methods:
      init: ->
        @post = await api.call('post.get', @routeID)

      updatePost: (post) ->
        if isSame(@post, post)
          @post = post
</script>


<style lang="less" scoped>
  #posts-id{
    box-sizing: border-box;
    overflow: hidden;
    display: flex;
    justify-content: center;
    .wrap{
      margin-top: 36px;
      .left{
        width: 650px;
        flex: auto;
        >*{
          margin-bottom: 24px;
        }
      }
      .right{
        flex: none;
        margin-left: 90px;
        width: 240px;
        >*{
          margin-bottom: 36px;
        }
      }
    }
  }
</style>
