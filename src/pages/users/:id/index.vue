<template lang="jade">
  #users-detail(v-if="user")
    c-header(:user="user")
    keep-alive
      router-view.main(:user="user", :key="routeKey")
</template>


<script lang="coffee">
  module.exports =
    components:
      'c-header': require('./header')

    data: ->
      user: null

    computed:
      routeKey: -> "#{@$route.path}-#{@$route.query.type}-#{@$route.query.status}-#{@$route.hash}"

    created: ->
      @init()
      @listen('UPDATE_USER',  @updateUser)

    methods:
      init: ->
        @user = await api.call('user.get', @routeID)
        @user.marks ?= []

      change: (tab) ->
        @toUserPage(@user, tab.value)

      updateUser: (user) ->
        if isSame(user, @user)
          @user = user
</script>


<style lang="less" scoped>
  #users-detail{
    .main{
      margin: -55px auto 50px;
    }
  }
</style>
