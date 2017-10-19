<template lang="jade">
  .create-mark
    .row.-left(v-if="model.mark.isShowScore(status)", :style="rateRowStyle")
      rate(:score="score" size="12px")
      favor-group(:favor="favor", :subject="subject" size="12px")
    text-area.comment(v-if="comment", :text="comment")
    .subject.row.-top
      .left
        text-area.intro(:text="subject.intro", :limit="120" indent)
      .right
        photo-frame
          subject-face(:subject="subject")
</template>


<script lang="coffee">
  module.exports =
    components:
      'rate':         require('components/@/rate')
      'favor-group':  require('components/@/favor-group')
      'text-area':    require('components/@/text-area')
      'photo-frame':  require('components/wiki/photo-frame')
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
    .rate{
      color: #445669;
    }
    .favor-group{
      margin-left: 8px;
      font-weight: 500;
      color: #445669;
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