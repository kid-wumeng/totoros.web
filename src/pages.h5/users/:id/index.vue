<template lang="jade">
  #users-detail(v-if="user")
    c-head(:user="user")
    overview(:user="user")
</template>


<script lang="coffee">
  module.exports =
    components:
      'c-head':   require('./head')
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
    background-color: #FFF;
  }
</style>
