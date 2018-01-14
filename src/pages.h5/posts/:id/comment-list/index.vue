<template lang="jade">
  comment-list(
    :comments="comments",
    :page="page",
    :total="total",
    @more="more"
  )
</template>


<script lang="coffee">
  module.exports =
    components:
      'comment-list': require('components.h5/comment-list')

    props:
      'post':
        type: Object
        required: true

    data: ->
      comments: []
      page: 0
      total: 0

    created: ->
      @init()

    activated: ->
      @init()

    methods:
      init: ->
        @page = 0
        @more()

      more: ->
        @page += 1
        result = await api.call('comment.getAll', {
          at:   'post'
          id:   @routeID
          page: @page
        })
        @comments = @comments.concat(result.comments)
        @total = result.total
</script>


<style lang="less" scoped>
  .comment-list{
  }
</style>