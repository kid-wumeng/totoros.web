<template lang="jade">
  #timeline
    row
      public-timeline
</template>


<script lang="coffee">
  module.exports =
    components:
      'public-timeline':  require('./public-timeline')
</script>


<style lang="less" scoped>
  #timeline{
    overflow: hidden;
    >.row2{
      margin: 40px auto;
      width: 720px;
    }
  }
</style>
