<template lang="jade">
  modal.edit-modal(@close="$emit('close')")
    .panel
      form-item(label="* 序号" hint="阿拉伯数字：动画第几集 / 漫画第几话")
        c-input(v-model="order", type="number")

      form-item(label="中文名")
        c-input(v-model="name")

      form-item(label="原版名")
        c-input(v-model="nameOrigin")

      form-item(label="本 集/话 简介")
        c-input-area(v-model="intro")

      .row.-right
        c-button(@click="submit") 确认提交
</template>


<script lang="coffee">
  module.exports =
    components:
      'modal':        require('components/@/modal')
      'form-item':    require('components/@/form-item')
      'c-input':      require('components/@/input')
      'c-input-area': require('components/@/input-area')
      'c-button':     require('components/@/button')

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
      intro:      @episode?.intro ? ''

    methods:
      submit: ->
        if @episode
          @update()
        else
          @create()

      create: ->
        try
          if(!@model.assets.isNumber(@order))
            throw "请输入序号"
          else
            result = await @api.call('episode.create', @subject.id, {
              order:      parseFloat(@order)
              name:       @name
              nameOrigin: @nameOrigin
              intro:      @intro
            })
            @notify('done', '添加成功')
            @commit('CREATE_EPISODE', result.episode)
            @commit('edit-subject-episodes-modal/ADD_RECORD', result.record)
            @$emit('close')
        catch error
          @fail(error)

      update: ->
        try
          if(!@model.assets.isNumber(@order))
            throw "请输入序号"
          else
            result = await @api.call('episode.update', @episode.id, {
              order:      parseFloat(@order)
              name:       @name
              nameOrigin: @nameOrigin
              intro:      @intro
            })
            @notify('done', '修改成功')
            @commit('UPDATE_EPISODE', result.episode)
            @commit('edit-subject-episodes-modal/ADD_RECORD', result.record)
            @$emit('close')
        catch error
          @fail(error)

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