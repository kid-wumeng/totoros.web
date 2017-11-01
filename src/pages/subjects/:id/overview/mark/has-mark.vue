<template lang="jade">
  detail-box.has-mark(:title="title")
    row.-between
      mark-score(:mark="mark")
      c-button.-gray(@click="showModal") 修改标记
    text-area.comment(v-if="comment", :text="comment" indent)
</template>


<script lang="coffee">
  module.exports =
    components:
      'detail-box': require('components/wiki/detail-box')
      'mark-score': require('components/user/mark-score')
      'c-button':   require('components/@/button')
      'text-area':  require('components/@/text-area')

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
    .comment{
      margin-top: 10px;
      line-height: 19px;
    }
  }
</style>