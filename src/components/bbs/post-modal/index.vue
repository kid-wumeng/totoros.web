<template lang="jade">
  modal.post-modal(v-if="state['post-modal'].open", @close="commit('post-modal/HIDE')")
    panel
</template>


<script lang="coffee">
  module.exports =
    components:
      'modal': require('components/@/modal')
      'panel': require('./panel')
</script>


<style lang="less" scoped>
  .post-modal{
  }
</style>
