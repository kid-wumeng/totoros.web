<template lang="jade">
  modal.club-banner-modal(v-if="state['club-banner-modal'].open" @close="commit('club-banner-modal/HIDE')")
    panel
</template>


<script lang="coffee">
  module.exports =
    components:
      'modal': require('components/@/modal')
      'panel': require('./panel')
</script>