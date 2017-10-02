<template lang="jade">
  #login
    .wrap
      c-input(v-model="email" placeholder="Email")
      c-input(v-model="pass"  placeholder="密码" type="password")
      .button(@click="submit") 登登登 ... 录 ~ ！
</template>


<script lang="coffee">
  module.exports =
    components:
      'c-input': require('components/@/Input')

    data: ->
      email: ''
      pass:  ''

    methods:
      submit: ->
        @api.call('account.login', @email, @pass).done(@done).fail(@fail)

      done: (tokenString) ->
        localStorage.setItem('tokenString', tokenString)
        @dispatch('account/checkin').then(@welcome)

      welcome: ->
        @notify('done', "欢迎回来 ~ 啪啪啪", 3000)
        @$router.replace('/')

      fail: ({message})->
        @notify('fail', message, 3000)
</script>


<style lang="less" scoped>
  #login{
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
