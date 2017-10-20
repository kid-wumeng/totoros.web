<template lang="jade">
  modal.update-forum-modal(v-if="state['update-forum-modal'].open" @close="commit('update-forum-modal/HIDE')")
    panel
</template>


<script lang="coffee">
  module.exports =
    components:
      'modal': require('components/@/modal')
      'panel': require('./panel')
</script>


<style lang="less" scoped>
  .update-forum-modal{
  }
</style>
