<template lang="jade">
  modal.edit-subject-base-modal(v-if="state['edit-subject-base-modal'].open" @close="commit('edit-subject-base-modal/HIDE')")
    panel
</template>


<script lang="coffee">
  module.exports =
    components:
      'modal': require('components/@/modal')
      'panel': require('./panel')
</script>


<style lang="less" scoped>
  .edit-subject-base-modal{
  }
</style>
