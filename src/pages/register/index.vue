<template lang="jade">
  #register(v-if="checkined && !login")
    //- qa(v-if="!canRegister" @qa-pass="qaPass")
    .wrap
      h1 龙猫 ACG 社区
      c-input(v-model="email" placeholder="Email")
      c-input(v-model="pass"  placeholder="密码"     type="password")
      c-input(v-model="pass2" placeholder="密码确认" type="password")
      c-input(v-model="name"  placeholder="昵称")
      c-button(@click="submit") 加入我们
</template>


<script lang="coffee">
  module.exports =
    components:
      'c-input':  require('components/@/input')
      'c-button': require('components/@/button')
      'qa':       require('./qa')

    data: ->
      qaRightCount: 0
      canRegister: false
      email: ''
      pass:  ''
      pass2: ''
      name:  ''

    metaInfo: ->
      title: '注册'

    methods:
      qaPass: (qaRightCount) ->
        @qaRightCount = qaRightCount
        @canRegister = true

      submit: ->
        if @check()
          @register()

      check: ->
        try
          @model.account.checkEmail(@email)
          @model.account.checkPass(@pass, @pass2)
          @model.account.checkName(@name)
          return true
        catch error
          @notify('fail', error, 3000)
          return false

      register: ->
        try
          tokenString = await @api.call('account.register', @email, @pass, @name, @qaRightCount)
          @done(tokenString)
        catch error
          @fail(error)

      done: (tokenString) ->
        localStorage.setItem('tokenString', tokenString)
        @dispatch('account/checkin').then(@welcome)

      welcome: ->
        @notify('done', '注册成功，欢迎你成为 TOTOROS 的一员 ~ 啪啪啪', 5000)
        @$router.replace('/')

      fail: (error)->
        @notify('warn', error.message, 3000)
</script>


<style lang="less" scoped>
  #register{
    .wrap{
      position: fixed;
      left: 50%;
      top: 50%;
      width: 260px;
      margin-left: -130px;
      margin-top: -136px;
      h1{
        text-align: center;
        font-size: 24px;
        margin-bottom: 36px;
      }
      .input{
        margin-bottom: 12px;
      }
      .button{
        display: block;
      }
    }
  }
</style>
