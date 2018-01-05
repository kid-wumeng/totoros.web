<template lang="jade">
  .comment-item
    row
      .left
        user-face(:user="comment.user")
      .right
        row.-between.-center
          row.left.-center
            user-name(:user="comment.user")
            .motto(v-if="comment.user.motto") {{ comment.user.motto }}
          .right
            .date {{ model.date.display(comment.createDate) }}
        markdown-area(:content="comment.content")
        reply-list(:comment="comment")
        reply-form(:comment="comment")
</template>


<script lang="coffee">
  module.exports =
    components:
      'user-face':     require('components/image/user-face')
      'user-name':     require('components/user/user-name')
      'markdown-area': require('components/@/markdown-area')
      'reply-form':    require('./reply-form')
      'reply-list':    require('./reply-list')

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