<template lang="jade">
  detail-box.posts(v-if="posts.length" title="相关帖子")
    post-item(v-for="post in posts", :key="post.id", :post="post")
</template>


<script lang="coffee">
  module.exports =
    components:
      'detail-box': require('components/wiki/detail-box')
      'post-item':  require('components/wiki/post-item')

    props:
      'subject':
        type: Object
        required: true

    computed:
      posts: -> @subject.posts ? []
</script>


<style lang="less" scoped>
  .posts{
    .post-item{
      box-sizing: border-box;
      padding: 12px 16px;
      &:nth-child(even){
        background-color: rgb(250, 250, 250);
      }
    }
  }
</style>