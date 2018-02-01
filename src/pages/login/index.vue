<template lang="jade">
  #login(v-if="checkined && !login")
    .wrap
      h1 龙猫 ACG 社区
      row.-right
        .forget(@click="$router.push('/reset-pass')") 忘记密码？
      c-input(v-model="email" placeholder="Email")
      c-input(v-model="pass"  placeholder="密码" type="password")
      c-button(@click="submit") 登录
</template>


<script lang="coffee">
  module.exports =
    components:
      'c-input':  require('components/@/input')
      'c-button': require('components/@/button')

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
        @notify('done', "欢迎回来 ~ 啪啪啪", 3000)
        @$router.replace('/')

      fail: (error)->
        @notify('fail', error.message, 3000)
</script>


<style lang="less" scoped>
  #login{
    .wrap{
      position: fixed;
      left: 50%;
      top: 50%;
      width: 260px;
      margin-left: -130px;
      margin-top: -96px;
      h1{
        text-align: center;
        font-size: 24px;
        margin-bottom: 36px;
      }
      .forget{
        display: flex;
        justify-content: flex-end;
        cursor: pointer;
        margin-bottom: 8px;
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
