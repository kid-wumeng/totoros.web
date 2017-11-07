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
    @padding: 8px;
    @border: 1px dashed #F2F2F2;
    margin-top: 20px;
    .post-item{
      margin-bottom:  @padding;
      padding-bottom: @padding + 1;
      &:first-child{
        margin-top:  @padding + 1;
        padding-top: @padding;
      }
    }
  }
</style>