<template lang="jade">
  .frame(v-if="role")
    detail-frame
      .name(slot="name") {{ role.name }}
      .desc(slot="desc") 角色
      detail-tab-bar(
        slot="tab-bar",
        :tabs="tabs",
        :active="$route.meta.path",
        @change="change"
      )
      router-view(slot="main", :role="role")
      side-bar(slot="side", :role="role")
</template>


<script lang="coffee">
  module.exports =
    components:
      'detail-frame':   require('components/wiki/detail-frame')
      'detail-tab-bar': require('components/wiki/detail-tab-bar')
      'side-bar':       require('./side-bar')

    props:
      'role':
        type: Object
        required: true

    computed:
      name:       -> @role.name
      nameOrigin: -> @role.nameOrigin
      
      tabs: -> [{
        label: if @nameOrigin then @nameOrigin else @name
        value: ''
      }]

    methods:
      change: (tab) ->
        @replaceRolePage(@role, tab.value)
</script>


<style lang="less" scoped>
  .frame{
    display: flex;
    background-color: #FFF;
  }
</style>
