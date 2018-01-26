<template lang="jade">
  row.floor(:class="floorClass")
    .left
      user-face(:user="user")
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
      'active':
        type: Boolean
        default: false
      'showEdit':
        type: Boolean
        default: false

    computed:
      floorClass: ->
        '-active': @active

    methods:
      clickUpdate:    -> @$emit('update')
      clickReference: -> @$emit('reference')
</script>


<style lang="less" scoped>
  .floor{
    box-sizing: border-box;
    width: 100%;
    padding: 36px;
    align-items: stretch;
    >.right{
      flex: auto;
    }
    .user-face{
      width: 60px;
      margin-right: 30px;
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
      font-size: 13px;
      color: #A2AEBA;
    }
    .edit{
      margin-left: 8px;
      >*{
        font-size: 13px;
        color: #A2AEBA;
      }
      >.text{
        margin: 0 2px;
        font-weight: 500;
        color: lighted(#707C88, 10%);
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
      margin-top: 30px;
      margin-bottom: 30px;
      padding: 0 12px;
      border-left: 3px solid #ADD9CF;
      line-height: 19px;
      text-align: justify;
      .user{
        margin-right: 6px;
        font-weight: 600;
        font-size: 12px;
      }
      .content{
        font-size: 13px;
        color: #707C88;
      }
    }
    .markdown-area{
      margin-top: 17px;
      padding-right: 40px;
      text-align: justify;
    }
  }
  .floor.-active{
    .markdown-area{
      font-weight: 500;
    }
  }
</style>