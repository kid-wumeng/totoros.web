<template lang="jade">
  #admin-clubs
    action-bar
    club-list
    create-club-modal
    update-club-modal
    club-banner-modal
</template>


<script lang="coffee">
  module.exports =
    components:
      'action-bar':         require('./action-bar')
      'club-list':         require('./club-list')
      'create-club-modal': require('components/bbs/create-club-modal')
      'update-club-modal': require('components/bbs/update-club-modal')
      'club-banner-modal':   require('components/bbs/club-banner-modal')

    methods:
      init: ->
        @dispatch('admin-clubs/init')
</script>


<style lang="less" scoped>
  #admin-clubs{
  }
</style>
