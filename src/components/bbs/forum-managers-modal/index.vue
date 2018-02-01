<template lang="jade">
  modal.forum-managers-modal(v-if="state['forum-managers-modal'].open" @close="commit('forum-managers-modal/HIDE')")
    panel
</template>


<script lang="coffee">
  module.exports =
    components:
      'modal': require('components/@/modal')
      'panel': require('./panel')
</script>