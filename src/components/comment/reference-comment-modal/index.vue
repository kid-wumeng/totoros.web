<template lang="jade">
  modal.reference-comment-modal(v-if="state['reference-comment-modal'].open", @close="commit('reference-comment-modal/HIDE')")
    panel
</template>


<script lang="coffee">
  module.exports =
    components:
      'modal': require('components/@/modal')
      'panel': require('./panel')
</script>


<style lang="less" scoped>
  .reference-comment-modal{
  }
</style>
