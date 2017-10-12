<template lang="jade">
  #animes
    forum-frame(active="animes")
</template>


<script lang="coffee">
  module.exports =
    components:
      'forum-frame': require('components/bbs/forum-frame')
</script>


<style lang="less" scoped>
  #animes{
  }
</style>
