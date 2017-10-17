<template lang="jade">
  modal.user-banner-modal(v-if="state['user-banner-modal'].open" @close="commit('user-banner-modal/HIDE')")
    panel
</template>


<script lang="coffee">
  module.exports =
    components:
      'modal': require('components/@/modal')
      'panel': require('./panel')
</script>