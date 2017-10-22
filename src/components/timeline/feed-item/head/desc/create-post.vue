<template lang="jade">
  .create-post
    span 发布了新的帖子
    span 『
    span.post-title(@click="toPostPage(post)") {{ title }}
    span 』
</template>


<script lang="coffee">
  module.exports =
    props:
      'feed':
        type: Object
        required: true

    computed:
      post:  -> @feed.post
      title: -> @post?.title
</script>


<style lang="less" scoped>
  .create-post{
    >*{
      font-size: inherit;
      color: inherit;
    }
    .post-title{
      margin: 0 2px;
      font-weight: 600;
      color: #445669;
      cursor: pointer;
      &:hover{
        text-decoration: underline;
      }
    }
  }
</style>