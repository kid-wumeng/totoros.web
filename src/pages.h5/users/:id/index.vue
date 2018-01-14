<template lang="jade">
  #users-detail(v-if="user")
    c-header(:user="user")
    overview(:user="user")
</template>


<script lang="coffee">
  module.exports =
    components:
      'c-header': require('./header')
      'overview': require('./overview')

    data: ->
      user: null

    created: ->
      @init()

    methods:
      init: ->
        @user = await api.call('user.get', @routeID)
        @user.marks ?= []
</script>


<style lang="less" scoped>
  #users-detail{
  }
</style>
