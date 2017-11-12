<template lang="jade">
  modal.forum-face-modal(v-if="state['forum-face-modal'].open" @close="commit('forum-face-modal/HIDE')")
    panel
</template>


<script lang="coffee">
  module.exports =
    components:
      'modal': require('components/@/modal')
      'panel': require('./panel')
</script>