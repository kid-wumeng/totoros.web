<template lang="jade">
  #timeline
    public-timeline
</template>


<script lang="coffee">
  module.exports =
    components:
      'public-timeline': require('./public-timeline')
</script>


<style lang="less" scoped>
  #timeline{
    padding: 20px 0;
    background-color: #FFF;
  }
</style>
