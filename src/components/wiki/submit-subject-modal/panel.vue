<template lang="jade">
  .panel
    h1 词条收录：动画、漫画、游戏
    c-input(v-model="name" placeholder="作品的名字")
    type-radio-bar(v-model="type")
    c-button(@click="submit") 确认提交
</template>


<script lang="coffee">
  module.exports =
    components:
      'c-input':        require('components/@/input')
      'c-button':       require('components/@/button')
      'type-radio-bar': require('components/wiki/type-radio-bar')

    data: ->
      name: ''
      type: ''

    methods:
      submit: ->
        try
          @check()
          api.call('subject.create', {name: @name, type: @type}).done(@done)
        catch error
          @notify('fail', error)

      check: ->
        if(!@name)
          throw '作品名字还没填呢 ~'
        if(!@type)
          throw '作品类别还没选呢 ~'

      done: ->
        @notify('done', '词条创建成功，请继续编辑资料 ~')
        @commit('HIDE_SUBMIT_SUBJECT_MODAL')
</script>


<style lang="less" scoped>
  .panel{
    width: 300px;
    >*{
      margin-bottom: 12px;
    }
    h1{
      text-align: center;
    }
    .button{
      display: block;
    }
  }
</style>
