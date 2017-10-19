<template lang="jade">
  modal.create-role-modal(v-if="state['create-role-modal'].open", @close="commit('create-role-modal/HIDE')")
    panel
</template>


<script lang="coffee">
  module.exports =
    components:
      'modal': require('components/@/modal')
      'panel': require('./panel')
</script>


<style lang="less" scoped>
  .create-role-modal{
  }
</style>
