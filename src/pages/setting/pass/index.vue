<template lang="jade">
  #setting-pass.col
    form-item(label="　当前密码", :label-width="0")
      c-input(v-model="oldPass" type="password")

    form-item(label="　　新密码", :label-width="0")
      c-input(v-model="newPass" type="password")

    form-item(label="新密码确认", :label-width="0")
      c-input(v-model="newPass2" type="password")

    c-button(@click="submit") 确认修改
</template>


<script lang="coffee">
  module.exports =
    components:
      'form-item': require('components/@/form-item')
      'c-input':   require('components/@/input')
      'c-button':  require('components/@/button')

    data: ->
      oldPass:  ''
      newPass:  ''
      newPass2: ''

    metaInfo: ->
      title: '密码'

    methods:
      submit: ->
        if @check()
          @update()

      check: ->
        try
          @model.account.checkPass(@newPass, @newPass2)
          return true
        catch message
          @notify('fail', message, 3000)
          return false

      update: ->
        try
          user = await @api.call('account.updatePass', @oldPass, @newPass)
          @notify('done', '修改成功')
        catch error
          @notify('fail', error.message, 3000)

        @oldPass  = ''
        @newPass  = ''
        @newPass2 = ''
</script>


<style lang="less" scoped>
  #setting-pass{
    align-items: stretch;
    >*{
      margin-bottom: 16px;
      &:last-child{
        margin-bottom: 0;
      }
    }
    >.button{
      align-self: flex-end;
    }
  }
</style>
