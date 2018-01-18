<template lang="jade">
  tab-bar.forum-tab-bar(:tabs="tabs", :active="active", @change="change")
</template>


<script lang="coffee">
  module.exports =
    components:
      'tab-bar':   require('components/@/tab-bar')

    data: ->
      forums: []

    computed:
      tabs: ->
        return @forums.map (forum) ->
          return
            label: forum.name
            value: forum.id
            link:  "/forums/#{forum.id}"

      active: ->
        if /^\/forums/.test(@$route.matched?[0]?.path ? '')
          return @routeID
        else
          return null

    methods:
      init: ->
        @forums = await api.call('forum.getAll', {open: true})

      change: (tab) ->
        @$router.replace('/forums/' + tab.value)
</script>


<style lang="less">
  .forum-tab-bar{
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