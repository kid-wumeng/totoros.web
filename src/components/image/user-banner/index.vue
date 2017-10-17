<template lang="jade">
  cdn-image.user-banner(:path="path" cover @click="$emit('click')")
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
      version: -> @user.banner?.version
      path:    -> if @version then "users/#{@id}/banner?v=#{@version}" else ''
</script>


<style lang="less" scoped>
  .user-banner{
    height: 200px;
  }
</style>