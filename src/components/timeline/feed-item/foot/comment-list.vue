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
    .comment{
      line-height: 20px;
      margin-bottom: 8px;
      &:last-child{
        margin-bottom: 0;
      }
      .user-name{
        display: inline;
        font-size: 13px;
      }
      .content{
        margin-left: 6px;
        font-size: 13px;
        color: #707C88;
      }
    }
  }
</style>