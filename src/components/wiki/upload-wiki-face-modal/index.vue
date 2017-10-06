<template lang="jade">
  modal.upload-wiki-face-modal(v-if="state['upload-wiki-face-modal'].open" @close="commit('HIDE_UPLOAD_WIKI_FACE_MODAL')")
    panel
</template>


<script lang="coffee">
  module.exports =
    components:
      'modal': require('components/@/modal')
      'panel': require('./panel')
</script>


<style lang="less" scoped>
  .upload-wiki-face-modal{
  }
</style>
