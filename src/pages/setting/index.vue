<template lang="jade">
  #setting(v-if="login && user")
    .wrap
      tab-bar
      .main
        router-view
</template>


<script lang="coffee">
  module.exports =
    components:
      'tab-bar': require('./tab-bar')

    metaInfo: ->
      switch @$route.meta.path
        when 'base'   then title = '个人档案'
        when 'pass'   then title = '密码'
        when 'logout' then title = '退出登录'
      return {title}

    computed:
      user: -> @state['setting'].user

    created: ->
      @init()

    watch: ->
      'loginUser': ->
        @init()

    methods:
      init: ->
        @dispatch('setting/init')
</script>


<style lang="less" scoped>
  #setting{
    background-color: #FFF;
    overflow: hidden;
    >.wrap{
      margin: 32px auto;
      width: 480px;
      >.main{
        padding: 16px;
        border: 1px solid #FFF;
        border-radius: 3px;
        box-shadow: 0 0 6px -3px #000;
      }
    }
  }
</style>
