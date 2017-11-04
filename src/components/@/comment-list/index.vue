<template lang="jade">
  .comment-list(v-if="comments.length")
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
    @padding: 12px;
    @border: 1px solid #F2F2F2;
    padding: @padding;
    .comment-item{
      margin-bottom:  @padding;
      border-bottom:  @border;
      padding-bottom: @padding + 1;
      &:last-child{
        margin-bottom: 0;
        border-bottom: none;
        padding-bottom: 0;
      }
    }
  }
</style>