<template lang="jade">
  .step-1
    c-input(v-model="email" placeholder="Email")
    c-button(@click="submit") 发送验证邮件，重置密码
</template>


<script lang="coffee">
  module.exports =
    components:
      'c-input':  require('components/@/input')
      'c-button': require('components/@/button')

    data: ->
      email: ''

    methods:
      submit: ->
        try
          @model.account.checkEmail(@email)
          await @api.call('account.sendResetPassMail', @email)
          @notify('done', '已发送，请在12小时内查看邮件（有可能被投递进垃圾箱）', 5000)
        catch error
          @notify('fail', error, 3000)
</script>


<style lang="less" scoped>
  .step-1{
    position: fixed;
    left: 50%;
    top: 50%;
    width: 260px;
    margin-left: -130px;
    margin-top: -39px;
    .input{
      margin-bottom: 12px;
    }
    .button{
      display: block;
    }
  }
</style>
