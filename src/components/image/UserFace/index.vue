<template lang="jade">
  c-image.user-face(:url="url" cover)
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
      url: -> "users/#{@user?.id}/face?v=#{user?.face?.version}"
</script>


<style lang="less" scoped>
  .user-face{
    border-radius: 3px;
    cursor: pointer;
  }
</style>
