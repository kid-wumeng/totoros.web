<template lang="jade">
  modal.confirm(v-if="state.confirm.open" @close="commit('confirm/HIDE')")
    panel
</template>


<script lang="coffee">
  module.exports =
    components:
      'modal': require('components/@/modal')
      'panel': require('./panel')
</script>


<style lang="less" scoped>
  .confirm{
    z-index: 12;
  }
</style>
