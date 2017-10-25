<template lang="jade">
  #login(v-if="checkined && !login")
    .wrap
      c-input(v-model="email" placeholder="Email")
      c-input(v-model="pass"  placeholder="密码" type="password")
      c-button(@click="submit") 登登登 ... 录 ~ ！
</template>


<script lang="coffee">
  module.exports =
    components:
      'c-input':  require('components/@/input')
      'c-button': require('components/@/button')

    data: ->
      email: ''
      pass:  ''

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
    display: flex;
    justify-content: center;
    align-items: center;
    .wrap{
      margin-top: 10%;
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
