<template lang="jade">
  modal.create-subject-modal(v-if="state['create-subject-modal'].open", @close="commit('create-subject-modal/HIDE')")
    panel
</template>


<script lang="coffee">
  module.exports =
    components:
      'modal': require('components/@/modal')
      'panel': require('./panel')
</script>


<style lang="less" scoped>
  .create-subject-modal{
  }
</style>
