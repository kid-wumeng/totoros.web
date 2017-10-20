<template lang="jade">
  #admin-feedbacks
    h1 feedbacks
</template>


<script lang="coffee">
  module.exports =
    components:
      'detail-frame':   require('components/wiki/detail-frame')
      'detail-tab-bar': require('components/wiki/detail-tab-bar')
</script>


<style lang="less" scoped>
  #admin-feedbacks{
  }
</style>
