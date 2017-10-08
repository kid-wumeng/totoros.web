<template lang="jade">
  detail-box.has-mark(:title="title")
    rate(
      v-if="isShowScore",
      :score="score",
    )
    favor-group(
      v-if="isShowFavor",
      :favor="favor",
      :subject="subject"
    )
    text-area(
      v-if="comment",
      :text="comment"
    )
    c-button.-gray(@click="showModal") 修改标记
</template>


<script lang="coffee">
  module.exports =
    components:
      'detail-box':  require('components/wiki/detail-box')
      'c-button':    require('components/@/button')
      'rate':        require('components/@/rate')
      'favor-group': require('components/@/favor-group')
      'text-area':   require('components/@/text-area')

    props:
      'mark':
        type: Object
        required: true

    computed:
      subject: -> @mark.subject
      status:  -> @mark.status
      score:   -> @mark.score   ? 0
      favor:   -> @mark.favor   ? {}
      comment: -> @mark.comment ? ''

      title: ->
        status = @model.mark.displayStatus(@status, @subject.type)
        createDate = @model.date.display(@mark.createDate)
        return "我#{status}：#{createDate}"

      isShowScore: -> @model.mark.isShowScore(@status)
      isShowFavor: -> @model.mark.isShowFavor(@status) and (@favor.story or @favor.image or @favor.music or @favor.enjoy)

    methods:
      showModal: ->
        @dispatch('show-mark-modal', {subject: @subject})
</script>


<style lang="less" scoped>
  .has-mark{
    .rate{
      margin-top: -1px;
    }
    .favor-group{
      margin-top: 6px;
    }
    .text-area{
      margin-top: 4px;
    }
    .button{
      margin-top: 10px;
      width: 100%;
    }
  }
</style>