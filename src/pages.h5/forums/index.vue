<template lang="jade">
  #forums
    .wrap
      //- tab-bar
      router-view
</template>


<script lang="coffee">
  module.exports =
    components:
      'tab-bar': require('./tab-bar')
</script>


<style lang="less" scoped>
  #forums{
    overflow: hidden;
    .wrap{
      margin: 32px auto;
      width: 100%;
    }
  }
</style>