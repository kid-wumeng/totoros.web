<template lang="jade">
  .frame(v-if="organization")
    detail-frame
      .name(slot="name") {{ organization.name }}
      .desc(slot="desc") 团体
      detail-tab-bar(
        slot="tab-bar",
        :tabs="tabs",
        :active="$route.meta.path",
        @change="change"
      )
      router-view(slot="main", :organization="organization")
      side-bar(slot="side", :organization="organization")
</template>


<script lang="coffee">
  module.exports =
    components:
      'detail-frame':   require('components/wiki/detail-frame')
      'detail-tab-bar': require('components/wiki/detail-tab-bar')
      'side-bar':       require('./side-bar')

    props:
      'organization':
        type: Object
        required: true

    computed:
      name:       -> @organization.name
      nameOrigin: -> @organization.nameOrigin

      tabs: -> [{
        label: if @nameOrigin then @nameOrigin else @name
        value: ''
      }]

    methods:
      change: (tab) ->
        @replaceRolePage(@organization, tab.value)
</script>


<style lang="less" scoped>
  .frame{
    display: flex;
    background-color: #FFF;
  }
</style>
