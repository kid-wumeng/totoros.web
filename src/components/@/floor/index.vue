<template lang="jade">
  row.floor
    .left
      user-face(:user="user" circle)
    .right
      .desc
        user-name(:user="user")
        .date {{ model.date.display(date) }}
      markdown-area(:content="content")
</template>


<script lang="coffee">
  module.exports =
    components:
      'user-face':     require('components/image/user-face')
      'user-name':     require('components/user/user-name')
      'markdown-area': require('components/@/markdown-area')

    props:
      'user':
        type: Object
        required: true
      'content':
        type: String
        required: true
      'date':
        type: Date
      'floor':
        type: String
</script>


<style lang="less" scoped>
  .floor{
    box-sizing: border-box;
    width: 100%;
    align-items: stretch;
    >.right{
      margin-top: 8px;
      flex: auto;
    }
    .user-face{
      width: 36px;
      margin-right: 12px;
    }
    .desc > *{
      display: inline;
    }
    .user-name{
      font-size: 13px;
    }
    .date{
      margin-left: 8px;
      font-size: 13px;
      color: #A2AEBA;
    }
    .markdown-area{
      margin-left: 13px;
      margin-top: 13px;
      text-align: justify;
    }
  }
</style>