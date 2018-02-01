<template lang="jade">
  #logout(v-if="login")
    c-button.-gray(@click="logout") 退出登录
</template>


<script lang="coffee">
  module.exports =
    components:
      'c-button': require('components/@/button')

    metaInfo: ->
      title: '退出登录'

    methods:
      logout: ->
        localStorage.removeItem('tokenString')
        @commit('account/SET_USER', null)
        @notify('done', '已成功退出，欢迎再次回归 ~', 4000)
        @$router.replace('/')
</script>


<style lang="less" scoped>
  #logout{
    display: flex;
    justify-content: center;
    align-items: center;
    margin-top: 200px;
  }
</style>
