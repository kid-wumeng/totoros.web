<template lang="jade">
  #roles-id(v-if="role")
    detail-frame
      .name(slot="name") {{ role.name }}
      .desc(slot="desc") {{ desc }}
      router-view(slot="main", :role="role")
      side-bar(slot="side", :role="role")
</template>


<script lang="coffee">
  module.exports =
    components:
      'detail-frame':   require('components/wiki/detail-frame')
      'detail-tab-bar': require('components/wiki/detail-tab-bar')
      'side-bar':       require('./side-bar')

    computed:
      id:   -> parseInt(@$route.params.id)
      role: -> @state['role-list'].items[@id]
      desc: -> '角色'

    created: ->
      @init()

    watch:
      'id': -> @init()

    methods:
      init: ->
        @dispatch('get-role', @id)

      change: (tab) ->
        @toRolePage(@role, tab.value)
</script>


<style lang="less" scoped>
  #roles-id{
    display: flex;
  }
</style>
