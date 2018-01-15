<template lang="jade">
  .floor
    row.-between.-center
      row.left.-center
        user-face(:user="user" circle)
        user-name(:user="user")
        .date {{ model.date.display(date) }}
      .right
        .display-floor {{ floor }}
    .reference(v-if="reference")
      span.user @{{ reference.user.name }}
      span.content {{ reference.content }}
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
      'reference':
        type: Object
</script>


<style lang="less" scoped>
  .floor{
    box-sizing: border-box;
    width: 100%;
    padding: 20px;
    align-items: stretch;
    background-color: #FFF;
    margin-bottom: 8px;
    .user-face{
      width: 32px;
      margin-right: 9px;
    }
    .user-name{
      font-size: 13px;
    }
    .date{
      margin-left: 8px;
      font-size: 12px;
      color: #A2AEBA;
    }
    .display-floor{
      font-size: 13px;
      font-weight: 600;
      color: #A2AEBA;
    }
    .reference{
      margin: 0 9px;
      margin-top: 19px;
      padding: 0 12px;
      text-align: justify;
      border-left: 3px solid #ADD9CF;
      .user{
        margin-right: 6px;
        font-weight: 600;
        font-size: 13px;
      }
      .content{
        font-size: 13px;
        color: #A2AEBA;
      }
    }
    .markdown-area{
      margin-top: 16px;
      padding: 0 7px;
      text-align: justify;
    }
  }
</style>