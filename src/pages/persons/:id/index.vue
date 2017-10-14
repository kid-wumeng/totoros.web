<template lang="jade">
  #persons-id(v-if="person")
    detail-frame
      .name(slot="name") {{ person.name }}
      .desc(slot="desc") {{ desc }}
      detail-tab-bar(
        slot="tab-bar",
        :tabs="tabs",
        :active="$route.meta.path",
        @change="change"
      )
      router-view(slot="main", :person="person")
      side-bar(slot="side", :person="person")
</template>


<script lang="coffee">
  module.exports =
    components:
      'detail-frame':   require('components/wiki/detail-frame')
      'detail-tab-bar': require('components/wiki/detail-tab-bar')
      'side-bar':       require('./side-bar')

    data: ->
      tabs: [{
        label: 'Overview'
        value: ''
      }]

    computed:
      id:     -> parseInt(@$route.params.id)
      person: -> @state['person-list'].items[@id]
      desc:   -> '人物'

    created: ->
      @init()

    watch:
      'id': -> @init()

    methods:
      init: ->
        @dispatch('get-person', @id)

      change: (tab) ->
        @toRolePage(@person, tab.value)
</script>


<style lang="less" scoped>
  #persons-id{
    display: flex;
  }
</style>
