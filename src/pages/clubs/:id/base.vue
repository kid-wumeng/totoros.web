<template lang="jade">
  row.base
    .left
      club-face(:club="club")
    .right
      .name {{ club.name }}
      .intro {{ club.intro }}
</template>


<script lang="coffee">
  module.exports =
    components:
      'club-face': require('components/image/club-face')

    props:
      'club':
        type: Object
        required: true
</script>


<style lang="less" scoped>
  .base{
    .right{
      margin-left: 10px;
    }
    .club-face{
      width: 64px;
    }
    .name{
      font-weight: 600;
      font-size: 14px;
      color: #273340;
    }
    .intro{
      margin-top: 2px;
      width: 400px;
      font-size: 13px;
      color: #707C88;
    }
  }
</style>