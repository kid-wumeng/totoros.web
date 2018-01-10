<template lang="jade">
  .comment-item
    floor(:user="comment.user", :content="comment.content", :date="comment.createDate", :floor="'#'+comment.floor")
</template>


<script lang="coffee">
  module.exports =
    components:
      'floor':      require('components/@/floor')
      # 'reply-form': require('./reply-form')
      # 'reply-list': require('./reply-list')

    props:
      'comment':
        type: Object
        required: true
</script>


<style lang="less" scoped>
  .comment-item{
    box-sizing: border-box;
    width: 100%;
    align-items: stretch;
    >.row2{
      >.right{
        flex: auto;
      }
      .user-face{
        width: 48px;
        margin-right: 10px;
      }
      .user-name{
        font-size: 13px;
        color: #E09F7D;
      }
      .motto{
        margin-left: 5px;
        font-size: 13px;
        color: #A2AEBA;
      }
      .date{
        margin-right: 6px;
        font-size: 12px;
        color: #A2AEBA;
      }
      .markdown-area{
        margin-left: 12px;
        margin-top: 6px;
        width: 85%;
      }
    }
  }
</style>