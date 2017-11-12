<template lang="jade">
  modal.forum-banner-modal(v-if="state['forum-banner-modal'].open" @close="commit('forum-banner-modal/HIDE')")
    panel
</template>


<script lang="coffee">
  module.exports =
    components:
      'modal': require('components/@/modal')
      'panel': require('./panel')
</script>