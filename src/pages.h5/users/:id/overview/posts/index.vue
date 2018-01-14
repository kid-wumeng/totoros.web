<template lang="jade">
  .posts
    detail-area(title="发布的主题")
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
        posts = @user.posts ? []
        return posts.slice(0, 10)
</script>


<style lang="less" scoped>
  .posts{
    .item{
      padding: 0 20px;
      padding-bottom: 8px;
      border-bottom: 1px dotted #F2F2F2;
      margin-bottom: 8px;
    }
    .item:last-child{
      padding-bottom: 0;
      border-bottom: none;
      margin-bottom: 0;
    }
  }
</style>