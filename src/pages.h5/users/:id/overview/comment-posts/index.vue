<template lang="jade">
  .comment-posts
    detail-area(title="最近参与的帖")
      item(v-for="post in posts", :key="post.id", :post="post")
</template>


<script lang="coffee">
  module.exports =
    components:
      'detail-area': require('components.h5/detail-area')
      'item':        require('./item')

    props:
      'user':
        type: Object
        required: true

    computed:
      posts: ->
        posts = @user.commentPosts ? []
        return posts.slice(0, 10)
</script>


<style lang="less" scoped>
  .comment-posts{
    .item{
      padding: 0 20px;
      padding-bottom: 8px;
      border-bottom: 1px dotted #F2F2F2;
      margin-bottom: 8px;
    }
    .item:last-child{
      border-bottom: none;
      margin-bottom: 0;
    }
  }
</style>