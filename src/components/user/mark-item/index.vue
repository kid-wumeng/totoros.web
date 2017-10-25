<template lang="jade">
  .mark-item.row.-left.-top
    .left
      photo-frame
        subject-face(:subject="subject")
    .right
      .row.-left
        .name(@click="toSubjectPage(subject)") {{ name }}
        .desc {{ desc }}
      .row.-left
        rate(:score="score" size="13px")
        favor-group(:favor="favor", :subject="subject" size="13px")
      text-area(:text="comment", :indent="comment.length > 100")
</template>


<script lang="coffee">
  module.exports =
    components:
      'photo-frame':  require('components/wiki/photo-frame')
      'subject-face': require('components/image/subject-face')
      'rate':         require('components/@/rate')
      'favor-group':  require('components/@/favor-group')
      'text-area':    require('components/@/text-area')

    props:
      'mark':
        type: Object
        required: true

    computed:
      subject: -> @mark.subject
      name:    -> @subject.name
      type:    -> @model.subject.displayType(@subject.type)
      season:  -> @subject.season
      desc:    ->
        desc = @type
        if(@season)
          desc += " / Season #{@season}"
        return desc
      score:   -> @mark.score
      favor:   -> @mark.favor
      comment: -> @mark.comment ? ''
</script>


<style lang="less" scoped>
  .mark-item{
    box-sizing: border-box;
    >.right{
      flex: auto;
      margin-left: 12px;
      >.row:nth-child(2){
        margin-top: 4px;
      }
    }
    .photo-frame{
      width: 80px;
    }
    .name{
      font-weight: 600;
      font-size: 14px;
      cursor: pointer;
      &:hover{
        text-decoration: underline;
      }
    }
    .desc{
      margin-left: 9px;
      font-size: 12px;
      color: #A2AEBA;
    }
    .favor-group{
      margin-left: 8px;
    }
    .text-area{
      margin-top: 5px;
      width: 60%;
      line-height: 19px;
      font-size: 13px;
    }
  }
</style>