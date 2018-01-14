<template lang="jade">
  row.base
    .left
      forum-face(:forum="forum")
    .right
      .name {{ forum.name }}
      text-area.intro(:text="forum.intro")
</template>


<script lang="coffee">
  module.exports =
    components:
      'forum-face': require('components/image/forum-face')
      'text-area':  require('components/@/text-area')

    props:
      'forum':
        type: Object
        required: true
</script>


<style lang="less" scoped>
  .base{
    .right{
      margin-left: 10px;
    }
    .forum-face{
      width: 64px;
    }
    .name{
      font-weight: 600;
      font-size: 14px;
      color: #273340;
    }
    .intro{
      margin-top: 2px;
      font-size: 12px;
      color: #707C88;
    }
  }
</style>