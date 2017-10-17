<template lang="jade">
  #register
    .wrap
      c-input(v-model="email" placeholder="Email")
      c-input(v-model="pass"  placeholder="密码"     type="password")
      c-input(v-model="pass2" placeholder="密码确认" type="password")
      c-input(v-model="name"  placeholder="昵称")
      c-button(@click="submit") 注注注 ... 册 ~ ！
</template>


<script lang="coffee">
  module.exports =
    components:
      'c-input':  require('components/@/input')
      'c-button': require('components/@/button')

    data: ->
      email: ''
      pass:  ''
      pass2: ''
      name:  ''

    methods:
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
          tokenString = await @api.call('account.register', @email, @pass, @name)
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
        @notify('warn', message, 3000)
</script>


<style lang="less" scoped>
  #register{
    display: flex;
    justify-content: center;
    align-items: center;
    .wrap{
      margin-top: -10%;
      width: 260px;
      .input{
        margin-bottom: 12px;
      }
      .button{
        display: block;
      }
    }
  }
</style>
