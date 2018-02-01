<template lang="jade">
  row.floor(:class="floorClass")
    .left
      user-face(:user="user", :radius="0")
    .right
      row.-between
        .desc
          user-name(:user="user")
          .date {{ model.date.display(date) }}
        row.desc-right.-center
          .edit(v-if="showEdit && login")
            span (
            span.text.btn-update(v-if="isMe(user)" @click="clickUpdate") 修改
            span.text.btn-reference(v-else @click="clickReference") 引用回复
            span )
          //- .display-floor(v-if="floor") {{ floor }}
      .reference(v-if="reference")
        router-link.user(:to="getUserPath(reference.user)") @{{ reference.user.name }}
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
    padding: 30px;
    align-items: stretch;
    >.right{
      flex: auto;
    }
    .user-face{
      width: 100px;
      margin-right: 27px;
    }
    .desc{
      flex: none;
    }
    .desc > *{
      display: inline;
      vertical-align: middle;
    }
    .user-name{
      font-size: 14px;
    }
    .date{
      margin-left: 12px;
      font-size: 12px;
      color: #CCC;
    }
    .edit{
      >*{
        font-size: 13px;
        color: #A2AEBA;
      }
      >.btn-reference{
        color: #445669;
      }
      >.text{
        margin: 0 3px;
        font-weight: 500;
        cursor: pointer;
        &:hover{
          text-decoration: underline;
        }
      }
    }
    .display-floor{
      margin-left: 12px;
      font-size: 14px;
      font-weight: 600;
      color: #CCC;
    }
    .reference{
      width: 80%;
      margin-top: 30px;
      margin-bottom: 30px;
      margin-left: 17px;
      margin-right: 40px;
      padding-left: 12px;
      border-left: 3px solid #ADD9CF;
      line-height: 24px;
      text-align: justify;
      .user{
        display: inline;
        margin-right: 6px;
        font-family: "Helvetica Neue", "Luxi Sans", "DejaVu Sans", Tahoma, "Hiragino Sans GB", "Microsoft Yahei", sans-serif;
        font-weight: 700;
        font-size: 14px;
        color: #445669;
        &:hover{
          text-decoration: underline;
        }
      }
      .content{
        font-size: 14px;
        color: darken(#A2AEBA, 10%);
      }
    }
    .markdown-area{
      margin-top: 17px;
      padding-left: 14px;
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