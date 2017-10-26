<template lang="jade">
  modal.edit-modal(@close="$emit('close')")
    .panel
      form-item(label="* 序号" hint="阿拉伯数字：动画第几集 / 漫画第几话")
        c-input(v-model="order", type="number")

      form-item(label="中文名")
        c-input(v-model="name")

      form-item(label="原版名")
        c-input(v-model="nameOrigin")

      .row.-right
        c-button(@click="submit") 确认提交
</template>


<script lang="coffee">
  module.exports =
    components:
      'modal':     require('components/@/modal')
      'form-item': require('components/@/form-item')
      'c-input':   require('components/@/input')
      'c-button':  require('components/@/button')

    props:
      'subject':
        type: Object
        required: true
      'episode':
        type: Object
        default: null

    data: ->
      order:      @episode?.order      ? ''
      name:       @episode?.name       ? ''
      nameOrigin: @episode?.nameOrigin ? ''

    methods:
      submit: ->
        if(!@model.assets.isNumber(@order))
          @notify('fail', '请输入序号')
        else
          if @episode then @update() else @create()

      create: ->
        try
          result = await @api.call('subject.createEpisode', @subject.id, @getData())
          @done(result)
        catch error
          @fail(error)

      update: ->
        try
          result = await @api.call('subject.updateEpisode', @subject.id, @episode.order, @getData())
          @done(result)
        catch error
          @fail(error)

      getData: ->
        data =
          order:      parseFloat(@order)
          name:       @name
          nameOrigin: @nameOrigin
        return data

      done: (result) ->
        @notify('done', '提交成功')
        @commit('UPDATE_SUBJECT', result.subject)
        @commit('edit-subject-episodes-modal/ADD_RECORD', result.record)
        @$emit('close')

      fail: (error) ->
        @notify('fail', error.message)
</script>


<style lang="less" scoped>
  .edit-modal{
    .panel{
      width: 480px;
      >*{
        margin-bottom: 16px;
        &:last-child{
          margin-bottom: 0;
        }
      }
    }
  }
</style>