<template lang="jade">
  desc-card(:name="forum.name", :desc="forum.intro")
    forum-face(slot="face", :forum="forum")
</template>


<script lang="coffee">
  module.exports =
    components:
      'forum-face': require('components/image/forum-face')
      'desc-card':  require('components.h5/desc-card')

    props:
      'forum':
        type: Object
        required: true
</script>


<style lang="less" scoped>
  .desc-card{
    padding: 20px;
    background-color: #FFF;
    .forum-face{
      width: 64px;
    }
  }
</style>