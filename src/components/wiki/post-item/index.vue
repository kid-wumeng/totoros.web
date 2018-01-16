<template lang="jade">
  row.post-item.-center
    .date {{ model.date.format('YY-MM-DD', post.createDate) }}
    post-title(:post="post")
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
  .post-item{
    flex-wrap: wrap;
    .date{
      flex: none;
      font-size: 13px;
      color: #A2AEBA;
    }
    .post-title{
      margin-left: 10px;
    }
  }
</style>