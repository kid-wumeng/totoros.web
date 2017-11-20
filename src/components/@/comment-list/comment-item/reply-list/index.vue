<template lang="jade">
  .reply-list(v-if="replies.length")
    reply-item(v-for="(reply, index) in replies", :key="index", :reply="reply")
</template>


<script lang="coffee">
  module.exports =
    components:
      'reply-item': require('./reply-item')

    props:
      'comment':
        type: Object
        required: true

    computed:
      replies: -> @comment.replies ? []
</script>


<style lang="less" scoped>
  .reply-list{
    margin-top: 20px;
    margin-left: 14px;
  }
</style>