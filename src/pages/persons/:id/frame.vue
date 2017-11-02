<template lang="jade">
  .frame(v-if="person")
    detail-frame
      .name(slot="name") {{ person.name }}
      .desc(slot="desc") 人物
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

    props:
      'person':
        type: Object
        required: true

    computed:
      name:       -> @person.name
      nameOrigin: -> @person.nameOrigin

      tabs: -> [{
        label: if @nameOrigin then @nameOrigin else @name
        value: ''
      }]

    methods:
      change: (tab) ->
        @replaceRolePage(@person, tab.value)
</script>


<style lang="less" scoped>
  .frame{
    display: flex;
    background-color: #FFF;
  }
</style>
