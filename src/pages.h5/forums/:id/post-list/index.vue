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
    box-sizing: border-box;
    .item{
      margin-top: 6px;
    }
  }
</style>