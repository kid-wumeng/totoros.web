<template lang="jade">
  c-image.user-face(:path="path" cover)
</template>


<script lang="coffee">
  module.exports =
    components:
      'c-image': require('components/image/Image')

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
