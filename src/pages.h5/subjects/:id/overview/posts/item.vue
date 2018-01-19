<template lang="jade">
  row.item.-between.-center
    post-title(:post="post")
    .date {{ model.date.display(post.createDate) }}
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
      font-size: 12px;
    }
    .post-title{
      font-size: 12px;
      margin-right: 6px;
    }
    .date{
      flex: none;
      color: #A2AEBA;
    }
  }
</style>