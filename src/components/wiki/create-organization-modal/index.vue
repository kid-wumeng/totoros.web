<template lang="jade">
  modal.create-organization-modal(v-if="state['create-organization-modal'].open", @close="commit('HIDE_CREATE_ORGANIZATION_MODAL')")
    panel
</template>


<script lang="coffee">
  module.exports =
    components:
      'modal': require('components/@/modal')
      'panel': require('./panel')
</script>


<style lang="less" scoped>
  .create-organization-modal{
  }
</style>
