<template lang="jade">
  modal.edit-subject-staffs-modal(v-if="state['edit-subject-staffs-modal'].open" @close="commit('edit-subject-staffs-modal/HIDE')")
    panel
</template>


<script lang="coffee">
  module.exports =
    components:
      'modal': require('components/@/modal')
      'panel': require('./panel')
</script>


<style lang="less" scoped>
  .edit-subject-staffs-modal{
  }
</style>
