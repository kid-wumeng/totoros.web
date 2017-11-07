<template lang="jade">
  .create-post
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
    span{
      word-break: break-all;
      font-weight: 500;
      font-size: 12px;
      color: #A2AEBA;
    }
    .post-title{
      font-weight: 500;
      color: #445669;
      cursor: pointer;
      &:hover{
        text-decoration: underline;
      }
    }
  }
</style>