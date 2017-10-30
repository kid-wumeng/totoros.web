<template lang="jade">
  .action-bar.row
    .left
      h1 SYNC
    .right
      c-button(@click="sync") 全局数据同步
</template>


<script lang="coffee">
  module.exports =
    components:
      'c-button': require('components/@/button')

    methods:
      sync: ->
        @dispatch('admin-sync/show-progress')
        await @api.call('syncAll')
        @commit('admin-sync/CLEAR_TIMER')
</script>


<style lang="less">
  .action-bar{
    padding: 12px;
    h1{
      color: #A2AEBA;
    }
  }
</style>