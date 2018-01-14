<template lang="jade">
  .post-list
    item(v-for="post in posts", :key="post.id", :post="post")
</template>


<script lang="coffee">
  module.exports =
    components:
      'item': require('./item')

    props:
      'posts':
        type: Array
        default: -> []
</script>


<style lang="less" scoped>
  .post-list{
    @padding: 6px;
    box-sizing: border-box;
    margin-top: 20px;
    border-top: 1px dashed #EEE;
    .item{
      padding-top:  @padding;
      border-bottom:  1px dashed #EEE;
      padding-bottom: @padding + 1;
      padding-left: 4px;
      padding-right: 4px;
      &:first-child{
        padding-top: @padding + 1;
      }
    }
  }
</style>