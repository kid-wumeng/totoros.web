<template lang="jade">
  modal.edit-organization-base-modal(v-if="state['edit-organization-base-modal'].open" @close="commit('HIDE_EDIT_ORGANIZATION_BASE_MODAL')")
    panel
</template>


<script lang="coffee">
  module.exports =
    components:
      'modal': require('components/@/modal')
      'panel': require('./panel')
</script>


<style lang="less" scoped>
  .edit-organization-base-modal{
  }
</style>
