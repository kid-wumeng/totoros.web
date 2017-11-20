<template lang="jade">
  .reply-item
    row
      .left
        user-face(:user="reply.user")
      .right
        row.-between.-center
          row.left.-center
            user-name(:user="reply.user")
            .motto(v-if="reply.user.motto") {{ reply.user.motto }}
          .right
            .date {{ model.date.display(reply.createDate) }}
        markdown-area(:content="reply.content")
</template>


<script lang="coffee">
  module.exports =
    components:
      'user-face':     require('components/image/user-face')
      'user-name':     require('components/user/user-name')
      'markdown-area': require('components/@/markdown-area')

    props:
      'reply':
        type: Object
        required: true
</script>


<style lang="less" scoped>
  .reply-item{
    box-sizing: border-box;
    width: 100%;
    align-items: stretch;
    padding: 8px 0;
    >.row2{
      >.right{
        flex: auto;
      }
      .user-face{
        width: 40px;
        margin-right: 10px;
      }
      .user-name{
        font-size: 12px;
        color: #000;
      }
      .motto{
        margin-left: 5px;
        font-size: 12px;
        color: #A2AEBA;
      }
      .date{
        margin-right: 6px;
        font-size: 12px;
        color: #A2AEBA;
      }
      .markdown-area{
        margin-left: 12px;
        margin-top: 4px;
        width: 85%;
        line-height: 20px;
        font-size: 13px;
      }
    }
  }
</style>