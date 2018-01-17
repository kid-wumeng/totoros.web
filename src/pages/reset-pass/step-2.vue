<template lang="jade">
  .step-2(v-if="checkined && !login")
    .wrap
      c-input(v-model="pass"  placeholder="新密码"     type="password")
      c-input(v-model="pass2" placeholder="新密码确认" type="password")
      c-button(@click="submit") 确认提交
</template>


<script lang="coffee">
  module.exports =
    components:
      'c-input':  require('components/@/input')
      'c-button': require('components/@/button')

    data: ->
      pass:  ''
      pass2: ''

    computed:
      email: -> @$route.query.email
      code:  -> @$route.query.code

    methods:
      submit: ->
        try
          @model.account.checkEmail(@email)
          @model.account.checkPass(@pass, @pass2)
          await @api.call('account.resetPass', {
            email: @email
            pass:  @pass
            code:  @code
          })
          @notify('done', '密码修改成功，请登录', 5000)
          @$router.replace('/login')
        catch error
          @notify('fail', error, 3000)
</script>


<style lang="less" scoped>
  .step-2{
    position: fixed;
    left: 50%;
    top: 50%;
    width: 260px;
    margin-left: -130px;
    margin-top: -62px;
    .input{
      margin-bottom: 12px;
    }
    .button{
      display: block;
    }
  }
</style>
