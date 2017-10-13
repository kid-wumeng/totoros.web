<template lang="jade">
  comment-list(
    :comments="comments",
    :page="routePage",
    :total="post.commentCount",
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
      'comments':
        type: Array
        default: -> []

    methods:
      changePage: (page) ->
        @$router.push("##{page}")
</script>


<style lang="less" scoped>
  .comment-list{
  }
</style>
