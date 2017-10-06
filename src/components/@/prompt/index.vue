<template lang="jade">
  modal.prompt(v-if="state.prompt.open" @close="commit('prompt/HIDE')")
    panel
</template>


<script lang="coffee">
  module.exports =
    components:
      'modal': require('components/@/modal')
      'panel': require('./panel')
</script>


<style lang="less" scoped>
  .prompt{
    z-index: 12;
  }
</style>
