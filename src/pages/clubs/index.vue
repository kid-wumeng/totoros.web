<template lang="jade">
  #clubs
    .wrap
      tab-bar
      router-view
</template>


<script lang="coffee">
  module.exports =
    components:
      'tab-bar': require('./tab-bar')
</script>


<style lang="less" scoped>
  #clubs{
    border-top: 1px solid rgba(245, 245, 245, 1);
    .wrap{
      margin: 16px auto;
      width: 800px;
    }
  }
</style>