<template lang="jade">
  #subjects-edit.row.-top.-left
    edit-side-bar(:tabs="tabs", :active="active")
    router-view.main
</template>


<script lang="coffee">
  module.exports =
    components:
      'edit-side-bar': require('components/wiki/EditSideBar')

    data: ->
      tabs: [{
        label: 'BASE'
        value: 'base'
      },{
        label: 'CAST'
        value: 'cast'
      },{
        label: 'STAFF'
        value: 'staff'
      }]

    computed:
      active: -> @$route.meta?.path
</script>


<style lang="less" scoped>
  #subjects-edit{
    height: 100%;
    overflow: scroll;
    background-color: #FFF;
    .main{
    }
  }
</style>
