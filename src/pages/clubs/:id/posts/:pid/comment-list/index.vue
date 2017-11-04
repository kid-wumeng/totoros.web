<template lang="jade">
  comment-list(
    :comments="comments",
    :page="routePage",
    :total="total",
    @change-page="changePage"
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

      createComment: (comment) ->
        if isSame(comment.post, @post)
          @comments.push(comment)
</script>


<style lang="less" scoped>
  .comment-list{
  }
</style>
