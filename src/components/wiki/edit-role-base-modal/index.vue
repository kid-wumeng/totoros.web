<template lang="jade">
  modal.edit-role-base-modal(v-if="state['edit-role-base-modal'].open" @close="commit('HIDE_EDIT_ROLE_BASE_MODAL')")
    panel
</template>


<script lang="coffee">
  module.exports =
    components:
      'modal': require('components/@/modal')
      'panel': require('./panel')
</script>


<style lang="less" scoped>
  .edit-role-base-modal{
  }
</style>
