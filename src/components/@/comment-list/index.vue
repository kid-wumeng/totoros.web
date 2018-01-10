<template lang="jade">
  .comment-list(v-if="comments.length")
    .wrap
      comment-item(v-for="comment in comments", :key="comment.id", :comment="comment")
    page-bar(:page="page", :size="size", :total="total" @change="changePage")
</template>


<script lang="coffee">
  module.exports =
    components:
      'comment-item': require('./comment-item')
      'page-bar':     require('components/@/page-bar')

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

    methods:
      changePage: (page) -> @$emit('change-page', page)
</script>


<style lang="less" scoped>
  .comment-list{
    .comment-item{
      padding-bottom: 20px;
      border-bottom: 1px solid #F2F2F2;
      margin-bottom: 20px;
    }
    .page-bar{
      margin-top: 20px;
    }
  }
</style>