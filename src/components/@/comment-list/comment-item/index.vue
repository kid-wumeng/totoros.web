<template lang="jade">
  .comment-item.row.-left
    .left
      user-face(:user="comment.user")
    .right
      row.-between.-center
        row.left.-center
          user-name(:user="comment.user")
          .motto {{ comment.user.motto }}
        .right
          .date {{ model.date.display(comment.createDate) }}
      markdown-area(:content="comment.content")
</template>


<script lang="coffee">
  module.exports =
    components:
      'user-face':     require('components/image/user-face')
      'user-name':     require('components/user/user-name')
      'markdown-area': require('components/@/markdown-area')

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
    >.right{
      flex: auto;
    }
    .user-face{
      width: 48px;
      margin-right: 9px;
    }
    .user-name{
      margin-right: 6px;
      font-weight: 600;
      font-size: 13px;
      color: #445669;
    }
    .motto{
      margin-right: 6px;
      font-size: 12px;
      color: #A2AEBA;
    }
    .date{
      margin-right: 6px;
      font-size: 12px;
      color: #CCC;
    }
    .markdown-area{
      margin-top: 5px;
      line-height: 20px;
      font-size: 13px;
    }
  }
</style>