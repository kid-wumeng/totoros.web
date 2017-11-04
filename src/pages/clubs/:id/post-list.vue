<template lang="jade">
  .post-list
    post-item(v-for="post in posts", :key="post.id", :post="post")
</template>


<script lang="coffee">
  module.exports =
    components:
      'post-item': require('components/bbs/post-item')

    props:
      'posts':
        type: Array
        default: -> []
</script>


<style lang="less" scoped>
  .post-list{
    .post-item{
      padding: 12px;
      &:nth-child(odd){
        background-color: rgb(250, 250, 250, 1);
      }
    }
  }
</style>