<template lang="jade">
  #clubs
    tab-bar
    router-view
</template>


<script lang="coffee">
  module.exports =
    components:
      'tab-bar': require('./tab-bar')

    data: ->
      club: null

    methods:
      init: ->
        @club = await api.call('club.get', @routeID)
</script>


<style lang="less" scoped>
  #clubs{
  }
</style>