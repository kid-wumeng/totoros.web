<template lang="jade">
  #organizations-id(v-if="organization")
    detail-frame
      .name(slot="name") {{ organization.name }}
      .desc(slot="desc") {{ desc }}
      router-view(slot="main", :organization="organization")
      side-bar(slot="side", :organization="organization")
</template>


<script lang="coffee">
  module.exports =
    components:
      'detail-frame':   require('components/wiki/detail-frame')
      'detail-tab-bar': require('components/wiki/detail-tab-bar')
      'side-bar':       require('./side-bar')

    computed:
      id:           -> @routeID
      organization: -> @state['organization-detail'].organization
      desc:         -> '团体'

    watch:
      'id': -> @init()

    methods:
      init: ->
        @dispatch('organization-detail/init', @id)

      change: (tab) ->
        @toRolePage(@organization, tab.value)
</script>


<style lang="less" scoped>
  #organizations-id{
    display: flex;
  }
</style>
