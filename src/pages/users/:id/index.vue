<template lang="jade">
  #users-detail(v-if="user")
    c-header(:user="user")
    router-view.main(:user="user")
</template>


<script lang="coffee">
  module.exports =
    components:
      'c-header': require('./header')

    data: ->
      user: null

    methods:
      init: ->
        @user = await api.call('user.get', @routeID)
        @user.marks ?= []

      change: (tab) ->
        @toUserPage(@user, tab.value)
</script>


<style lang="less" scoped>
  #users-detail{
    background-color: rgba(250, 250, 250, 0.93);
    .main{
      margin: -55px auto 0;
    }
  }
</style>
