<template lang="jade">
  #users-detail(v-if="user")
    c-header(:user="user")
    router-view.main(:user="user")
</template>


<script lang="coffee">
  module.exports =
    components:
      'c-header': require('./header')

    computed:
      id:   -> @routeID
      user: -> @state['user-detail'].user

    created: ->
      @init()

    methods:
      init: ->
        @dispatch('user-detail/init', @id)

      change: (tab) ->
        @toUserPage(@user, tab.value)
</script>


<style lang="less" scoped>
  #users-detail{
    .main{
      margin: -40px auto 0;
      width: 1000px;
    }
  }
</style>
