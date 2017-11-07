<template lang="jade">
  #timeline
    row
      left-timeline
</template>


<script lang="coffee">
  module.exports =
    components:
      'left-timeline':  require('./left-timeline')
      'right-timeline': require('./right-timeline')
</script>


<style lang="less" scoped>
  #timeline{
    margin: 32px auto;
    width: 1000px;
  }
</style>
