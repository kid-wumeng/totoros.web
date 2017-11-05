<template lang="jade">
  .action-bar.row(v-if="login")
    .action(v-if="admin") 置顶
    .action(v-if="isMe(post.user)", @click="update") 修改帖子
</template>


<script lang="coffee">
  module.exports =
    props:
      'post':
        type: Object
        required: true

    methods:
      update: ->
        @dispatch('post-modal/show', {post: @post})
</script>


<style lang="less" scoped>
  .action-bar{
    .action{
      font-weight: 600;
      font-size: 12px;
      color: #A2AEBA;
      cursor: pointer;
      margin-left: 12px;
    }
  }
</style>
