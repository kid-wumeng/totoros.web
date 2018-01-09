<template lang="jade">
  detail-box.blog(title="最近的日志")
</template>


<script lang="coffee">
  module.exports =
    components:
      'detail-box': require('components/bbs/detail-box')
</script>


<style lang="less" scoped>
  .blog{
  }
</style>