<template lang="jade">
  .create-mark
    row
      mark-score(v-if="model.mark.isShowScore(status)", :mark="mark")
      text-area.comment(v-if="comment", :text="comment")
    .subject.row.-top.box-frame.-outset
      .left
        .name(@click="toSubjectPage(subject)") {{ name }}
        text-area.intro(v-if="subject.intro", :text="subject.intro", :limit="120" indent)
      .right
        subject-face(:subject="subject")
</template>


<script lang="coffee">
  module.exports =
    components:
      'mark-score':   require('components/user/mark-score')
      'text-area':    require('components/@/text-area')
      'subject-face': require('components/image/subject-face')

    props:
      'feed':
        type: Object
        required: true

    computed:
      mark:    -> @feed.mark
      subject: -> @mark?.subject
      status:  -> @mark?.status
      score:   -> @mark?.score
      favor:   -> @mark?.favor
      comment: -> @mark?.comment
      name:    -> @subject?.name
</script>


<style lang="less" scoped>
  .create-mark{
    >.row2:first-child{
      margin-bottom: 16px;
    }
    .left{
      flex: auto;
      margin-right: 12px;
    }
    .mark-score{
      flex: none;
      margin-right: 13px;
    }
    .comment{
      font-size: 13px;
    }
    .subject{
      box-sizing: border-box;
      padding: 12px 14px;
      background-color: rgba(250, 250, 250, 1);
      border-radius: 0;
      .name{
        display: inline-block;
        font-weight: 600;
        font-size: 14px;
        cursor: pointer;
        &:hover{
          text-decoration: underline;
        }
      }
      .intro{
        margin-top: 6px;
        margin-right: 1px;
        font-size: 13px;
        color: #707C88;
      }
      .subject-face{
        width: 96px;
      }
    }
  }
</style>