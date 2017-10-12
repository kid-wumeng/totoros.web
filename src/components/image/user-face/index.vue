<template lang="jade">
  cdn-image.user-face(:path="path", square cover)
</template>


<script lang="coffee">
  module.exports =
    components:
      'cdn-image': require('components/image/cdn-image')

    props:
      'user':
        type: Object
        required: true

    computed:
      path: -> "users/#{@user?.id}/face?v=#{user?.face?.version}"
</script>


<style lang="less" scoped>
  .user-face{
    border-radius: 3px;
    cursor: pointer;
  }
</style>
