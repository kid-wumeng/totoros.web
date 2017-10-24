<template lang="jade">
  modal.edit-subject-casts-modal(v-if="state['edit-subject-casts-modal'].open" @close="commit('edit-subject-casts-modal/HIDE')")
    panel
</template>


<script lang="coffee">
  module.exports =
    components:
      'modal': require('components/@/modal')
      'panel': require('./panel')
</script>


<style lang="less" scoped>
  .edit-subject-casts-modal{
  }
</style>
