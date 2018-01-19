<template lang="jade">
  row.item
    .left
      subject-face(:subject="subject" frame)
    .right
      subject-name(:subject="subject")
      mark-score-simple(:mark="mark")
      text-area.comment(:text="comment")
      .user
        user-name(:user="user")
        .date {{ model.date.display(feed.createDate) }} {{model.mark.displayStatus(status, type)}}
</template>


<script lang="coffee">
  module.exports =
    components:
      'subject-face':      require('components/image/subject-face')
      'subject-name':      require('components/wiki/subject-name')
      'user-name':         require('components/user/user-name')
      'mark-score-simple': require('components/user/mark-score-simple')
      'text-area':         require('components/@/text-area')

    props:
      'feed':
        type: Object
        required: true

    computed:
      mark:    -> @feed.mark
      date:    -> @feed.createDate
      user:    -> @mark.user
      status:  -> @mark.status
      comment: -> @mark.comment
      subject: -> @mark.subject
      type:    -> @subject.type
      name:    -> @subject.name
</script>


<style lang="less" scoped>
  .item{
    box-sizing: border-box;
    padding: 16px 16px;
    background-color: #FFF;
    .left{
      flex: none;
    }
    .right{
      flex: auto;
      margin-left: 14px;
    }
    .subject-face{
      width: 60px;
    }
    .subject-name{
      font-size: 15px;
    }
    .mark-score-simple{
      margin-top: 11px;
    }
    .comment{
      margin-top: 11px;
      text-align: left;
    }
    .user{
      margin-top: 18px;
      display: flex;
      justify-content: flex-end;
      align-items: center;
      flex-wrap: wrap;
      .user-name{
        font-size: 12px;
      }
      .date{
        flex: none;
        margin-left: 6px;
        font-size: 12px;
        color: #A2AEBA;
      }
    }
  }
</style>
