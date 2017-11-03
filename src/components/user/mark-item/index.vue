<template lang="jade">
  row.mark-item
    .left
      subject-face(:subject="subject" frame)
    .right
      row.-between.-center
        row.-center
          .name(@click="toSubjectPage(subject)") {{ name }}
          .desc {{ desc }}
        row.-center
          .date {{ model.date.display(mark.createDate) }}
          c-button.-gray(v-if="isMe(mark.user)" @click="update") 修改标记
      row
        mark-score(:mark="mark")
        text-area.comment(:text="comment")
        column.-right
          mark-progress(v-if="mark.status === 'doing'", :mark="mark")
          resources(:subject="mark.subject")
</template>


<script lang="coffee">
  module.exports =
    components:
      'subject-face':  require('components/image/subject-face')
      'mark-score':    require('components/user/mark-score')
      'mark-progress': require('components/user/mark-progress')
      'text-area':     require('components/@/text-area')
      'c-button':      require('components/@/button')
      'resources':     require('./resources')

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
      comment: -> @mark.comment ? ''

    methods:
      update: ->
        @dispatch('mark-modal/show', {subject: @subject})
</script>


<style lang="less" scoped>
  .mark-item{
    box-sizing: border-box;
    >.right{
      flex: auto;
      margin-left: 14px;
      >:nth-child(2){
        margin-top: 8px;
      }
    }
    .subject-face{
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
    .date{
      font-size: 12px;
      color: #A2AEBA;
    }
    .button{
      margin-left: 8px;
    }
    .mark-score{
      flex: none;
    }
    .comment{
      flex: none;
      width: 480px;
      margin-left: 12px;
      line-height: 19px;
      font-size: 13px;
    }

    .column{
      flex: auto;
    }
    .mark-progress{
      flex: none;
      box-sizing: border-box;
      padding-left: 80px;
    }
  }
</style>