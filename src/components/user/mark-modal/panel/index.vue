<template lang="jade">
  .panel
    h1 标记{{ model.subject.displayType(subject.type) }}：{{ subject.name }}
    row.area
      column.left
        radio-bar.status(v-model="status")
          radio(:label="model.mark.displayStatus('will-do', subject.type)", value="will-do")
          radio(:label="model.mark.displayStatus('doing',   subject.type)", value="doing")
          radio(:label="model.mark.displayStatus('done',    subject.type)", value="done")
          radio(:label="model.mark.displayStatus('do-not',  subject.type)", value="do-not")
        rate(v-if="status !== 'will-do' && model.mark.isShowItem(subject.type, 'story')" v-model="story" label="　故事")
        rate(v-if="status !== 'will-do' && model.mark.isShowItem(subject.type, 'image')" v-model="image" label="　画面")
        rate(v-if="status !== 'will-do' && model.mark.isShowItem(subject.type, 'music')" v-model="music" label="　音乐")
        rate(v-if="status !== 'will-do' && model.mark.isShowItem(subject.type, 'enjoy')" v-model="enjoy" label="游戏性")
        input-area.comment(v-model="comment" placeholder="说几句吧...", :rows="5")
    .wrap
      row.action-bar.-between.-center
        check(v-model="share" label="分享至MARKS")
        c-button(@click="submit") OK，标记
</template>


<script lang="coffee">
  module.exports =
    components:
      'radio-bar':  require('components/@/radio-bar')
      'radio':      require('components/@/radio')
      'input-area': require('components/@/input-area')
      'check':      require('components/@/check')
      'c-button':   require('components/@/button')
      'rate':       require('./rate')

    data: ->
      subject:  @state['mark-modal'].subject
      mark:     @state['mark-modal'].mark
      id:       @state['mark-modal'].mark?.id
      status:   @state['mark-modal'].mark?.status   ? @state['mark-modal'].initStatus
      story:    @state['mark-modal'].mark?.story    ? 0
      image:    @state['mark-modal'].mark?.image    ? 0
      music:    @state['mark-modal'].mark?.music    ? 0
      enjoy:    @state['mark-modal'].mark?.enjoy    ? 0
      comment:  @state['mark-modal'].mark?.comment  ? ''
      progress: @state['mark-modal'].mark?.progress ? 0
      share:    if @state['mark-modal'].mark?.id then false else true

    methods:
      submit: ->
        data =
          status:   @status
          story:    @story
          image:    @image
          music:    @music
          enjoy:    @enjoy
          comment:  @comment
          progress: @progress

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
    @width: 340px;
    @padding: 48px;
    position: relative;
    top: -10px;
    box-sizing: border-box;
    width: 100%;
    >h1{
      text-align: center;
      font-size: 20px;
      margin-bottom: 32px;
    }
    .area{
      justify-content: center;
      height: 360px;
    }
    .left{
      align-self: stretch;
      width: @width;
    }
    >.wrap{
      margin-top: 32px;
      padding: 12px 0;
      width: 100%;
      background-color: rgba(250, 250, 250, 1);
      .action-bar{
        width: @width * 2 + @padding * 2 + 1px;
        margin: 0 auto;
      }
    }
    .status{
      flex: none;
      margin-bottom: 32px;
    }
    .comment{
      flex: auto;
      margin-top: 32px;
    }
  }
</style>
