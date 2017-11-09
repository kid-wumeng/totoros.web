<template lang="jade">
  .comment-list.box-frame.-outset(v-if="comments.length")
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
      padding: 16px;
      border-bottom: 1px solid #F4F4F4;
      &:last-child{
        border-bottom: none;
      }
      &:nth-child(odd){
        background-color: rgba(250, 250, 250, 0.93);
      }
    }
  }
</style>