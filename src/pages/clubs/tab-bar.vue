<template lang="jade">
  tab-bar.club-tab-bar(:tabs="tabs", :active="active", @change="change")
</template>


<script lang="coffee">
  module.exports =
    components:
      'tab-bar':   require('components/@/tab-bar')

    data: ->
      clubs: []

    computed:
      tabs: ->
        return @clubs.map (club) ->
          return
            label: club.name
            value: club.id

      active: ->
        if /^\/clubs/.test(@$route.matched?[0]?.path ? '')
          return @routeID
        else
          return null

    methods:
      init: ->
        @clubs = await api.call('club.getAll', {open: true})

      change: (tab) ->
        @$router.replace('/clubs/' + tab.value)
</script>


<style lang="less">
  .club-tab-bar{
    margin: 0 auto;
    width: 800px;
    .tab{
      padding: 6px 12px;
      font-weight: 500;
      border-bottom: 1px solid transparent;
      .label{
        font-size: 13px;
        color: #A2AEBA;
      }
    }
    .tab.-active{
      font-weight: 600;
      border-bottom: 1px solid #445669;
      .label{
        color: #445669;
      }
    }
  }
</style>