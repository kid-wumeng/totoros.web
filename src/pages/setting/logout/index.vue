<template lang="jade">
  #setting-logout
    c-button.-gray(@click="logout") 退出登录
</template>


<script lang="coffee">
  module.exports =
    components:
      'c-button': require('components/@/button')

    methods:
      logout: ->
        localStorage.removeItem('tokenString')
        @commit('account/SET_USER', null)
        @notify('done', '已成功退出登录，欢迎再次回归 ~', 4000)
        @$router.replace('/')
</script>


<style lang="less" scoped>
  #setting-logout{
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
