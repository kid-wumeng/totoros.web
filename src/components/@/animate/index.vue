<template lang="jade">
  transition.animate(
    :enter-active-class="'animated ' + enter",
    :leave-active-class="'animated ' + leave",
  ): slot
</template>


<script lang="coffee">
  module.exports =
    props:
      'enter':
        type: String
        default: ''
      'leave':
        type: String
        default: ''
</script>


<style lang="less" scoped>
</style>
