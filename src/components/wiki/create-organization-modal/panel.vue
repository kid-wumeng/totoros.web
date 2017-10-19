<template lang="jade">
  .panel
    h1 词条收录：团体
    c-input(v-model="name" placeholder="团体的名字" autofocus)
    c-button(@click="submit") 确认提交
</template>


<script lang="coffee">
  module.exports =
    components:
      'c-input':  require('components/@/input')
      'c-button': require('components/@/button')

    data: ->
      name: ''

    methods:
      submit: ->
        try
          @check()
          organization = await @api.call('organization.create', {name: @name})
          @done(organization)
        catch error
          @notify('fail', error)

      check: ->
        if(!@name)
          throw '团体名字还没填呢 ~'

      done: (organization) ->
        @notify('done', '词条创建成功，请继续编辑资料 ~')
        @commit('create-organization-modal/HIDE')
        @toOrganizationPage(organization)
</script>


<style lang="less" scoped>
  .panel{
    width: 300px;
    >*{
      margin-bottom: 12px;
    }
    h1{
      text-align: center;
    }
    .button{
      display: block;
    }
  }
</style>
