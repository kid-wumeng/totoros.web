<template lang="jade">
  router-link.post-title(:to="getPostPath(post)") {{ post.title }}
</template>


<script lang="coffee">
  module.exports =
    props:
      'post':
        type: Object
        required: true
</script>


<style lang="less" scoped>
  .post-title{
    display: inline;
    font-weight: 600;
    font-size: 14px;
    word-break: break-all;
    cursor: pointer;
    &:hover{
      text-decoration: underline;
    }
  }
</style>