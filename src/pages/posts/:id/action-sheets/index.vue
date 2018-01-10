<template lang="jade">
  .action-sheets(v-if="admin || isMe(post.user)")
    detail-box(title="操作")
      .action(v-if="admin") ADMIN：置顶
      .action(v-if="isMe(post.user)", @click="update") 修改帖子
</template>


<script lang="coffee">
  module.exports =
    components:
      'detail-box': require('components/bbs/detail-box')

    props:
      'post':
        type: Object
        required: true

    methods:
      update: ->
        @dispatch('post-modal/show', {post: @post})
</script>


<style lang="less" scoped>
  .action-sheets{
    .action{
      padding: 6px 8px;
      text-align: left;
      font-weight: 500;
      font-size: 13px;
      cursor: pointer;
      border-radius: 3px;
      &:hover{
        color: #FFF;
        background-image: linear-gradient(-180deg, #66C277 0%, #16a085 90%);
      }
    }
  }
</style>