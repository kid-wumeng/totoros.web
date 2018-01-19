<template lang="jade">
  detail-area.posts(v-if="posts.length" title="相关帖子")
    item(v-for="post in posts", :key="post.id", :post="post")
</template>


<script lang="coffee">
  module.exports =
    components:
      'detail-area': require('components.h5/detail-area')
      'item':        require('./item')

    props:
      'subject':
        type: Object
        required: true

    computed:
      posts: -> @subject.posts ? []
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
      border-bottom: none;
      margin-bottom: 0;
    }
  }
</style>