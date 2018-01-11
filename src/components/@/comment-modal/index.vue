<template lang="jade">
  modal.comment-modal(v-if="state['comment-modal'].open", @close="commit('comment-modal/HIDE')")
    panel
</template>


<script lang="coffee">
  module.exports =
    components:
      'modal': require('components/@/modal')
      'panel': require('./panel')
</script>


<style lang="less" scoped>
  .comment-modal{
  }
</style>
