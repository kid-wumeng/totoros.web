<template lang="jade">
  .create-mark
    .row.-left(v-if="model.mark.isShowScore(status)", :style="rateRowStyle")
      mark-score(:mark="mark")
    text-area.comment(v-if="comment", :text="comment")
    .subject.row.-top
      .left
        text-area.intro(:text="subject.intro", :limit="120" indent)
      .right
        subject-face(:subject="subject" frame)
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

      rateRowStyle: ->
        if @model.mark.isShowScore(@status)
          if @comment
            return {marginBottom: '6px'}
          else
            return {marginBottom: '12px'}
</script>


<style lang="less" scoped>
  .create-mark{
    >.row:first-child{
      margin-top: -4px;
    }
    .left{
      flex: auto;
      margin-right: 12px;
    }
    .comment{
      margin-bottom: 12px;
      font-size: 13px;
      color: #333;
    }
    .subject{
      box-sizing: border-box;
      padding: 12px 12px;
      background-color: rgba(250, 250, 250, 1);
      .subject-face{
        width: 100px;
      }
      .intro{
        color: #555;
      }
    }
  }
</style>