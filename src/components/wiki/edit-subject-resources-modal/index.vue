<template lang="jade">
  modal.edit-subject-resources-modal(v-if="state['edit-subject-resources-modal'].open" @close="commit('edit-subject-resources-modal/HIDE')")
    panel
</template>


<script lang="coffee">
  module.exports =
    components:
      'modal': require('components/@/modal')
      'panel': require('./panel')
</script>


<style lang="less" scoped>
  .edit-subject-resources-modal{
  }
</style>
