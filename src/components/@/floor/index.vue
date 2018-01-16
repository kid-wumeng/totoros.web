<template lang="jade">
  row.floor
    .left
      user-face(:user="user" circle)
    .right
      row.-between
        .desc
          user-name(:user="user")
          .date {{ model.date.display(date) }}
          .edit(v-if="showEdit && login")
            span (
            span.text(v-if="isMe(user)" @click="clickUpdate") 修改
            span.text(v-else @click="clickReference") 回复
            span )
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
      'showEdit':
        type: Boolean
        default: false

    methods:
      clickUpdate:    -> @$emit('update')
      clickReference: -> @$emit('reference')
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
      width: 32px;
      margin-right: 12px;
    }
    .desc{
      flex: none;
    }
    .desc > *{
      display: inline;
    }
    .user-name{
      font-size: 13px;
    }
    .date{
      margin-left: 8px;
      font-size: 12px;
      color: #A2AEBA;
    }
    .edit{
      margin-left: 8px;
      >*{
        font-size: 12px;
        color: #A2AEBA;
      }
      >.text{
        margin: 0 2px;
        font-weight: 500;
        color: #707C88;
        cursor: pointer;
        &:hover{
          text-decoration: underline;
        }
      }
    }
    .display-floor{
      font-size: 13px;
      font-weight: 600;
      color: #A2AEBA;
    }
    .reference{
      width: 80%;
      margin-top: 20px;
      margin-bottom: 20px;
      margin-left: 13px;
      padding: 0 12px;
      border-left: 3px solid #ADD9CF;
      line-height: 19px;
      text-align: justify;
      .user{
        margin-right: 6px;
        font-weight: 600;
        font-size: 13px;
      }
      .content{
        font-size: 13px;
        color: #707C88;
      }
    }
    .markdown-area{
      padding-left: 13px;
      padding-right: 13px;
      margin-top: 13px;
      text-align: justify;
    }
  }
</style>