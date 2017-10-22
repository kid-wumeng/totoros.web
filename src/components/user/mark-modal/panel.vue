<template lang="jade">
  .panel.col
    h1 标记动画：{{ subject.name }}

    radio-bar(v-model="status")
      radio(:label="model.mark.displayStatus('will-do', subject.type)", value="will-do")
      radio(:label="model.mark.displayStatus('doing',   subject.type)", value="doing")
      radio(:label="model.mark.displayStatus('done',    subject.type)", value="done")
      radio(:label="model.mark.displayStatus('do-not',  subject.type)", value="do-not")

    h2(v-if="isShowScore") 评分{{ hintScore }}
    rate(v-if="isShowScore" v-model="score", clickable, size="27px", padding="6px")

    h2(v-if="isShowFavor") 印象深刻的部分
    favor-group(v-if="isShowFavor" v-model="favor", clickable, :subject="subject", size="18px")

    input-area(v-model="comment" placeholder="说几句吧...", :rows="5")

    .action-bar.row
      check(v-model="share" label="分享至TIME-LINE")
      c-button(@click="submit") OK，标记
</template>


<script lang="coffee">
  module.exports =
    components:
      'radio-bar':   require('components/@/radio-bar')
      'radio':       require('components/@/radio')
      'rate':        require('components/@/rate')
      'favor-group': require('components/@/favor-group')
      'input-area':  require('components/@/input-area')
      'check':       require('components/@/check')
      'c-button':    require('components/@/button')

    data: ->
      subject: @state['mark-modal'].subject
      mark:    @state['mark-modal'].mark
      id:      @state['mark-modal'].mark?.id
      status:  @state['mark-modal'].mark?.status  ? @state['mark-modal'].initStatus
      score:   @state['mark-modal'].mark?.score   ? 0
      favor:   @state['mark-modal'].mark?.favor   ? {}
      comment: @state['mark-modal'].mark?.comment ? ''
      share:   if @state['mark-modal'].mark?.id then false else true

    computed:
      verb: ->
        return @model.mark.displayVerb(@subject.type)

      hintScore: ->
        switch @score
          when 1 then hint = "糟糕至极点"
          when 2 then hint = "不好#{@verb}，没感觉"
          when 3 then hint = "还行吧"
          when 4 then hint = "好#{@verb}~"
          when 5 then hint = "神之作"
        return if hint then "：#{hint}" else ''

      isShowScore: -> @model.mark.isShowScore(@status)
      isShowFavor: -> @model.mark.isShowFavor(@status)

    methods:
      submit: ->
        data =
          status:  @status
          score:   @score
          favor:   @favor
          comment: @comment

        if @id
          mark = await api.call('mark.update', @id, data, @share)
          @commit('UPDATE_MARK', mark)
        else
          mark = await api.call('mark.create', @subject.id, data, @share)
          @commit('CREATE_MARK', mark)

        @notify('done', '标记成功！')
        @commit('mark-modal/HIDE')
</script>


<style lang="less" scoped>
  .panel{
    position: relative;
    top: -5%;
    box-sizing: border-box;
    width: 340px;
    >*{
      width: 100%;
      display: flex;
      justify-content: center;
      margin-bottom: 30px;
      &:last-child{
        margin-bottom: 0;
      }
    }
    >h1{
      font-size: 20px;
    }
    >h2{
      margin-bottom: 8px;
      color: #707C88;
    }
    >.action-bar{
      justify-content: space-between;
    }
  }
</style>
