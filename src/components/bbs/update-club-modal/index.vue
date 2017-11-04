<template lang="jade">
  modal.update-club-modal(v-if="state['update-club-modal'].open" @close="commit('update-club-modal/HIDE')")
    panel
</template>


<script lang="coffee">
  module.exports =
    components:
      'modal': require('components/@/modal')
      'panel': require('./panel')
</script>


<style lang="less" scoped>
  .update-club-modal{
  }
</style>
