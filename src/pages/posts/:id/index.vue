<template lang="jade">
  #posts-id(v-if="post")
    row.wrap
      .left
        main-post(:post="post")
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
      'main-post':     require('./main-post')
      'comment-list':  require('./comment-list')
      'comment-form':  require('./comment-form')
      'action-sheets': require('./action-sheets')
      'relative-wiki': require('./relative-wiki')
      'reference-comment-modal': require('components/comment/reference-comment-modal')

    data: ->
      post: null

    metaInfo: ->
      title: if @post then @post.title else ''

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
    background-image: url(http://pattern8.com/images/pattern-thumbs/pattern8-pattern-21a.png);
    padding: 30px 0;
    .wrap{
      .left{
        box-sizing: border-box;
        width: 750px;
        flex: auto;
        border-radius: 2px;
        overflow: hidden;
      }
      .right{
        flex: none;
        margin-left: 12px;
        box-sizing: border-box;
        width: 280px;
        background-color: #FFF;
        border-radius: 2px;
        overflow: hidden;
        >*{
          margin-top: 30px;
          &:last-child{
          }
        }
      }
    }
  }
</style>
