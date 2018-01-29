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
    @padding: 10px;
    margin-top: 30px;
    border-top: 1px dashed #EEE;
    box-sizing: border-box;
    .post-item{
      padding-top:  @padding;
      border-bottom:  1px dashed #EEE;
      padding-bottom: @padding + 1;
      padding-left: 8px;
      padding-right: 8px;
      &:first-child{
        padding-top: @padding + 1;
      }
    }
  }
</style>