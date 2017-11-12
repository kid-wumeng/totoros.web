<template lang="jade">
  .panel
    h1 创建论坛
    c-input(v-model="name" placeholder="论坛的名字" autofocus)
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
          forum = await @api.call('forum.create', {name: @name})
          @done(forum)
        catch error
          @notify('fail', error)

      check: ->
        if(!@name)
          throw '论坛名字还没填呢 ~'

      done: (forum) ->
        @notify('done', '论坛创建成功')
        @commit('create-forum-modal/HIDE')
        @commit('CREATE_forum', forum)
</script>


<style lang="less" scoped>
  .panel{
    width: 300px;
    >*{
      margin-bottom: 12px;
    }
    >h1{
      text-align: center;
    }
    >.button{
      display: block;
    }
  }
</style>
