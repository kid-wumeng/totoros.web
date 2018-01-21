<template lang="jade">
  #users-detail(v-if="user")
    c-header(:user="user")
    keep-alive
      router-view.main(:user="user", :key="routeKey")

    mark-modal
</template>


<script lang="coffee">
  module.exports =
    components:
      'c-header':   require('./header')
      'mark-modal': require('components/user/mark-modal')

    data: ->
      user: null

    metaInfo: ->
      title: if @user then @user.name else ''
      meta: [{
        name: 'description'
        content: (@user?.intro ? @user?.name) ? ''
      }]

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
