<template lang="jade">
  modal.create-forum-modal(v-if="state['create-forum-modal'].open", @close="commit('create-forum-modal/HIDE')")
    panel
</template>


<script lang="coffee">
  module.exports =
    components:
      'modal': require('components/@/modal')
      'panel': require('./panel')
</script>