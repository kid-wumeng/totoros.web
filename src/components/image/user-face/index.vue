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
      id:      -> @user.id
      version: -> @user.face?.version
      path:    -> if @version then "users/#{@id}/face?v=#{@version}" else ''
</script>


<style lang="less" scoped>
  .user-face{
    border-radius: 3px;
    cursor: pointer;
  }
</style>
