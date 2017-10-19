<template lang="jade">
  .panel
    h1 词条收录：人物
    c-input(v-model="name" placeholder="人物的名字" autofocus)
    c-button(@click="submit") 确认提交
</template>


<script lang="coffee">
  module.exports =
    components:
      'c-input':  require('components/@/input')
      'c-button': require('components/@/button')

    data: ->
      name: ''

    methods:
      submit: ->
        try
          @check()
          person = await @api.call('person.create', {name: @name})
          @done(person)
        catch error
          @notify('fail', error)

      check: ->
        if(!@name)
          throw '人物名字还没填呢 ~'

      done: (person) ->
        @notify('done', '词条创建成功，请继续编辑资料 ~')
        @commit('create-person-modal/HIDE')
        @toPersonPage(person)
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
