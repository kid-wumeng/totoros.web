<template lang="jade">
  .has-mark
    row.-between
      .title {{ title }}
      .update(@click="showModal") 修改标记
    text-area.comment(v-if="comment", :text="comment")
    mark-score-simple(:mark="mark")
</template>


<script lang="coffee">
  module.exports =
    components:
      'detail-box':        require('components/wiki/detail-box')
      'mark-score-simple': require('components/user/mark-score-simple')
      'text-area':         require('components/@/text-area')

    props:
      'mark':
        type: Object
        required: true

    computed:
      subject: -> @mark.subject
      status:  -> @mark.status
      comment: -> @mark.comment ? ''

      title: ->
        status = @model.mark.displayStatus(@status, @subject.type)
        createDate = @model.date.display(@mark.createDate)
        return "我#{status}：#{createDate}"

    methods:
      showModal: ->
        @dispatch('mark-modal/show', {subject: @subject})
</script>


<style lang="less" scoped>
  .has-mark{
    padding: 16px 20px;
    border-left: 3px solid #ADD9CF;
    background-color: rgba(250, 250, 250, 0.93);
    .title{
      font-size: 13px;
      font-weight: 600;
    }
    .update{
      margin-left: 16px;
      font-weight: 600;
      font-size: 12px;
      color: #707C88;
      cursor: pointer;
      &:hover{
        text-decoration: underline;
      }
    }
    .comment{
      margin-top: 16px;
      margin-left: 13px;
      margin-right: 13px;
      line-height: 19px;
      font-size: 13px;
      color: #707C88;
    }
    .mark-score-simple{
      margin-top: 16px;
    }
  }
</style>