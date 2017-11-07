<template lang="jade">
  row.create-mark.-between
    column
      span.subject-name(@click="toSubjectPage(subject)") {{ name }}
      text-area.comment(v-if="comment", :text="comment", :limit="30")
    subject-face(:subject="subject")
</template>


<script lang="coffee">
  module.exports =
    components:
      'text-area':    require('components/@/text-area')
      'subject-face': require('components/image/subject-face')

    props:
      'feed':
        type: Object
        required: true

    computed:
      mark:    -> @feed.mark
      comment: -> @mark?.comment
      subject: -> @mark?.subject
      type:    -> @subject?.type
      name:    -> @subject?.name
</script>


<style lang="less" scoped>
  .create-mark{
    span{
      font-size: 12px;
      font-weight: 500;
      color: #A2AEBA;
    }
    .subject-name{
      font-weight: 500;
      font-size: 12px;
      color: #445669;
      cursor: pointer;
      &:hover{
        text-decoration: underline;
      }
    }
    .comment{
      margin-top: 2px;
      line-height: 15px;
      font-weight: 400;
      font-size: 12px;
      color: #777;
    }
    .subject-face{
      flex: none;
      margin-left: 8px;
      width: 48px;
    }
  }
</style>