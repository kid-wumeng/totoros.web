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
    @padding: 12px;
    @border: 1px solid #F2F2F2;
    .post-item{
      padding-top: @padding;
      border-bottom:  @border;
      padding-bottom: @padding + 1;
      &:first-child{
        padding-top: @padding + 1;
        border-top:  @border;
        padding-bottom: @padding;
      }
    }
  }
</style>