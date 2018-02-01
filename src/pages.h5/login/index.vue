<template lang="jade">
  #login(v-if="checkined && !login")
    .wrap
      h1 龙猫 ACG 社区
      .pc 电脑端网址：http://totoros.cc
      c-input(v-model="email" placeholder="Email")
      c-input(v-model="pass"  placeholder="密码" type="password")
      c-button(@click="submit") 登录
</template>


<script lang="coffee">
  module.exports =
    components:
      'c-input':  require('components.h5/input')
      'c-button': require('components.h5/button')

    data: ->
      email: ''
      pass:  ''

    metaInfo: ->
      title: '登录'

    methods:
      submit: ->
        try
          tokenString = await @api.call('account.login', @email, @pass)
          @done(tokenString)
        catch error
          @fail(error)

      done: (tokenString) ->
        localStorage.setItem('tokenString', tokenString)
        await @dispatch('account/checkin')
        @notify('done', "欢迎回来 ~", 3000)
        @$router.replace('/')

      fail: (error)->
        @notify('fail', error.message, 3000)
</script>


<style lang="less" scoped>
  #login{
    .wrap{
      margin: 0 auto;
      margin-top: 60px;
      width: 80%;
      h1{
        text-align: center;
        font-size: 20px;
        margin-bottom: 8px;
      }
      .pc{
        text-align: center;
        font-size: 13px;
        color: #707C88;
        margin-bottom: 40px;
      }
      .input{
        margin-bottom: 12px;
      }
      .button{
        margin-top: 6px;
        display: block;
      }
    }
  }
</style>
