<template lang="jade">
  .create-post
    span 发布了帖子 -
    span.post-title(@click="toPostPage(post)") {{ title }}
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
      margin-left: 4px;
      font-weight: 500;
      color: #445669;
      cursor: pointer;
      &:hover{
        text-decoration: underline;
      }
    }
  }
</style>