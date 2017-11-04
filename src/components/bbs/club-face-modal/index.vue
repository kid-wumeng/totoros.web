<template lang="jade">
  modal.club-face-modal(v-if="state['club-face-modal'].open" @close="commit('club-face-modal/HIDE')")
    panel
</template>


<script lang="coffee">
  module.exports =
    components:
      'modal': require('components/@/modal')
      'panel': require('./panel')
</script>