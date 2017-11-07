<template lang="jade">
  user-face.face(:user="user")
</template>


<script lang="coffee">
  module.exports =
    components:
      'user-face': require('components/image/user-face')

    props:
      'feed':
        type: Object
        required: true

    computed:
      'user': -> @feed.user
</script>


<style lang="less" scoped>
  .face{
    width: 48px;
  }
</style>