<template lang="jade">
  #setting-base.col
    form-item(label="昵称", :label-width="0")
      c-input(v-model="name")

    form-item(label="签名", :label-width="0")
      c-input(v-model="motto" placeholder="100字以内")

    form-item(label="简介", :label-width="0")
      c-input-area(v-model="intro" placeholder="2500字以内", :rows="16")

    c-button(@click="submit") 确认修改
</template>


<script lang="coffee">
  module.exports =
    components:
      'form-item':    require('components/@/form-item')
      'c-input':      require('components/@/input')
      'c-input-area': require('components/@/input-area')
      'c-button':     require('components/@/button')

    data: ->
      name:  @state['setting'].user.name
      motto: @state['setting'].user.motto ? ''
      intro: @state['setting'].user.intro ? ''

    metaInfo: ->
      title: '个人档案'

    methods:
      submit: ->
        if @check()
          @update()

      check: ->
        try
          @model.account.checkName(@name)
          @model.account.checkMotto(@motto)
          @model.account.checkIntro(@intro)
          return true
        catch message
          @notify('fail', message, 3000)
          return false

      update: ->
        try
          data =
            name:  @name
            motto: @motto
            intro: @intro
          user = await @api.call('account.updateBase', data)
          @commit('UPDATE_USER', user)
          @notify('done', '修改成功')
          @toUserPage(@loginUser)
        catch error
          @notify('fail', error.message, 3000)
</script>


<style lang="less" scoped>
  #setting-base{
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
