<template lang="jade">
  modal.create-club-modal(v-if="state['create-club-modal'].open", @close="commit('create-club-modal/HIDE')")
    panel
</template>


<script lang="coffee">
  module.exports =
    components:
      'modal': require('components/@/modal')
      'panel': require('./panel')
</script>