<template lang="jade">
  modal.create-person-modal(v-if="state['create-person-modal'].open", @close="commit('create-person-modal/HIDE')")
    panel
</template>


<script lang="coffee">
  module.exports =
    components:
      'modal': require('components/@/modal')
      'panel': require('./panel')
</script>


<style lang="less" scoped>
  .create-person-modal{
  }
</style>
