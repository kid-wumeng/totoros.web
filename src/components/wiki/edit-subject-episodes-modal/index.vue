<template lang="jade">
  modal.edit-subject-episodes-modal(v-if="state['edit-subject-episodes-modal'].open" @close="commit('edit-subject-episodes-modal/HIDE')")
    panel
</template>


<script lang="coffee">
  module.exports =
    components:
      'modal': require('components/@/modal')
      'panel': require('./panel')
</script>


<style lang="less" scoped>
  .edit-subject-episodes-modal{
  }
</style>
