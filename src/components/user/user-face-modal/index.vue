<template lang="jade">
  modal.user-face-modal(v-if="state['user-face-modal'].open" @close="commit('user-face-modal/HIDE')")
    panel
</template>


<script lang="coffee">
  module.exports =
    components:
      'modal': require('components/@/modal')
      'panel': require('./panel')
</script>