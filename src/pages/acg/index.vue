<template lang="jade">
  #acg
    forum-frame(active="acg")
      forum-action-bar(:fid="1")
      post-list(:fid="1")
</template>


<script lang="coffee">
  module.exports =
    components:
      'forum-frame':      require('components/bbs/forum-frame')
      'forum-action-bar': require('components/bbs/forum-action-bar')
      'post-list':        require('components/bbs/post-list')
</script>


<style lang="less" scoped>
  #acg{
  }
</style>
