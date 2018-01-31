<template lang="jade">
  modal.move-post-modal(v-if="state['move-post-modal'].open", @close="commit('move-post-modal/HIDE')")
    panel
</template>


<script lang="coffee">
  module.exports =
    components:
      'modal': require('components/@/modal')
      'panel': require('./panel')
</script>


<style lang="less" scoped>
  .move-post-modal{
  }
</style>
