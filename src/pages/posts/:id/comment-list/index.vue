<template lang="jade">
  comment-list(
    :comments="comments",
    :page="routePage",
    :total="total",
    @change-page="changePage"
    @reference="reference"
  )
</template>


<script lang="coffee">
  module.exports =
    components:
      'comment-list': require('components/@/comment-list')

    props:
      'post':
        type: Object
        required: true

    data: ->
      comments: []
      total: 0

    created: ->
      @listen('CREATE_COMMENT', @createComment)
      @listen('UPDATE_COMMENT', @updateComment)
      @listen('ADD_COMMENT_REPLY', @addCommentReply)

    watch:
      'routePage': -> @init()

    methods:
      init: ->
        result = await api.call('comment.getAll', {
          at:   'post'
          id:   @routeID
          page: @routePage
        })
        @comments = result.comments
        @total    = result.total

      changePage: (page) ->
        @$router.push("##{page}")

      reference: (referenceComment) ->
        @dispatch('reference-comment-modal/show', {
          referenceComment: referenceComment
          createMethod:     'createAtPost'
          atID:             @post.id
        })

      createComment: (comment) ->
        if @isSame(comment.post, @post)
          @comments.push(comment)

      updateComment: (comment) ->
        @updateItem(@comments, comment)

      addCommentReply: ({comment, reply}) ->
        for c in @comments
          if isSame(c, comment)
            c.replies ?= []
            c.replies.push(reply)
</script>


<style lang="less" scoped>
  .comment-list{
  }
</style>