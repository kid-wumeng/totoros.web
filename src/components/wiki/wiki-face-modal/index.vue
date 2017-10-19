<template lang="jade">
  modal.wiki-face-modal(v-if="state['wiki-face-modal'].open" @close="commit('wiki-face-modal/HIDE')")
    panel
</template>


<script lang="coffee">
  module.exports =
    components:
      'modal': require('components/@/modal')
      'panel': require('./panel')
</script>


<style lang="less" scoped>
  .wiki-face-modal{
  }
</style>
