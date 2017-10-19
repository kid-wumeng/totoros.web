<template lang="jade">
  .comment-list(v-if="comments.length")
    .comment(v-for="comment in comments", :key="comment.id")
      user-name(:user="comment.user")
      span.content {{ comment.content }}
</template>


<script lang="coffee">
  module.exports =
    components:
      'user-name':  require('components/user/user-name')

    props:
      'feed':
        type: Object
        required: true

    computed:
      comments: -> @feed.comments ? []
</script>


<style lang="less" scoped>
  .comment-list{
    margin-top: 6px;
    .comment{
      .user-name{
        display: inline;
        font-size: 12px;
      }
      .content{
        margin-left: 3px;
        font-size: 12px;
      }
    }
  }
</style>