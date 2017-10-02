<template lang="jade">
  .left
    edit-item(label="类别")
      type-radio-bar(:type="subject.type" @change="changeType")

    edit-item(label="中文名")
      edit-input(:value="subject.name" @change="changeName")

    edit-item(label="原版名")
      edit-input(:value="subject.nameOrigin" @change="changeNameOrigin")

    edit-item(label="简介")
      edit-input-area(:value="subject.intro" @change="changeIntro")
</template>


<script lang="coffee">
  module.exports =
    components:
      'c-input':         require('components/@/input')
      'c-button':        require('components/@/button')
      'edit-item':       require('components/wiki/edit-item')
      'edit-input':      require('components/wiki/edit-input')
      'edit-input-area': require('components/wiki/edit-input-area')
      'type-radio-bar':  require('components/wiki/type-radio-bar')

    props:
      'subject':
        type: Object
        required: true

    methods:
      changeType: (type) ->
        if type
          @submit({type})

      changeName: (name) ->
        @submit({name})

      changeNameOrigin: (nameOrigin) ->
        @submit({nameOrigin})

      changeIntro: (intro) ->
        @submit({intro})

      submit: (data) ->
        api.call('subject.update', @subject.id, data).done(@done)

      done: ->
        @notify('done', '修改成功 ~', 1200)
</script>


<style lang="less" scoped>
  .left{
    width: 480px;
    height: 100%;
    overflow: scroll;
    >*{
      margin-bottom: 12px;
    }
  }
</style>
