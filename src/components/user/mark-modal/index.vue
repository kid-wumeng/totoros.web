<template lang="jade">
  modal.mark-modal(v-if="state['mark-modal'].open" @close="commit('HIDE_MARK_MODAL')")
    panel
</template>


<script lang="coffee">
  module.exports =
    components:
      'modal': require('components/@/modal')
      'panel': require('./panel')
</script>


<style lang="less" scoped>
  .mark-modal{
  }
</style>
