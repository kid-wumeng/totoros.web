<template lang="jade">
  modal.edit-person-base-modal(v-if="state['edit-person-base-modal'].open" @close="commit('edit-person-base-modal/HIDE')")
    panel
</template>


<script lang="coffee">
  module.exports =
    components:
      'modal': require('components/@/modal')
      'panel': require('./panel')
</script>


<style lang="less" scoped>
  .edit-person-base-modal{
  }
</style>
