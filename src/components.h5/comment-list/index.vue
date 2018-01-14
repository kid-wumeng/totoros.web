<template lang="jade">
  .comment-list(v-if="comments.length")
    .wrap
      item(v-for="comment in comments", :key="comment.id", :comment="comment")
    more-button(:has-more-page="model.assets.hasMorePage(page, size, total)", @click="$emit('more')")
</template>


<script lang="coffee">
  module.exports =
    components:
      'item':        require('./item')
      'more-button': require('components.h5/more-button')

    props:
      'comments':
        type: Array
        default: -> []
      'page':
        type: Number
        default: 1
      'size':
        type: Number
        default: 50
      'total':
        type: Number
        default: 0
</script>


<style lang="less" scoped>
  .comment-list{
    .item{
      padding-bottom: 20px;
      border-bottom: 1px solid #F2F2F2;
      margin-bottom: 20px;
    }
    .page-bar{
      margin-top: 20px;
    }
  }
</style>