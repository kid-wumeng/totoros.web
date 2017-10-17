<template lang="jade">
  .panel
    h1 词条收录：角色
    c-input(v-model="name" placeholder="角色的名字" autofocus)
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
          role = await @api.call('role.create', {name: @name})
          @done(role)
        catch error
          @notify('fail', error)

      check: ->
        if(!@name)
          throw '角色名字还没填呢 ~'

      done: (role) ->
        @notify('done', '词条创建成功，请继续编辑资料 ~')
        @commit('HIDE_CREATE_ROLE_MODAL')
        @toRolePage(role)
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
