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
      id:   -> @routeID
      role: -> @state['role-detail'].role
      desc: -> '角色'

    watch:
      'id': -> @init()

    methods:
      init: ->
        @dispatch('role-detail/init', @id)

      change: (tab) ->
        @toRolePage(@role, tab.value)
</script>


<style lang="less" scoped>
  #roles-id{
    display: flex;
  }
</style>
