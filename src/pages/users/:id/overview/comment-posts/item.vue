<template lang="jade">
  .item
    post-title(:post="post")
    .date {{ model.date.display(post.commentDate) }}
</template>


<script lang="coffee">
  module.exports =
    components:
      'post-title': require('components/bbs/post-title')

    props:
      'post':
        type: Object
        required: true
</script>


<style lang="less" scoped>
  .item{
    >*{
      display: inline;
      font-size: 12px;
    }
    .post-title{
      font-size: 12px;
      margin-right: 6px;
    }
    .date{
      color: #A2AEBA;
    }
  }
</style>