<template lang="jade">
  row.base
    .left
      club-face(:club="club")
    .right
      .name  {{ club.name }}
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
      width: 40px;
    }
    .name{
      font-weight: 600;
    }
    .intro{
      font-size: 13px;
    }
  }
</style>