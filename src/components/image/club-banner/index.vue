<template lang="jade">
  cdn-image.club-banner(:path="path" cover @click="$emit('click')")
</template>


<script lang="coffee">
  module.exports =
    components:
      'cdn-image': require('components/image/cdn-image')

    props:
      'club':
        type: Object
        required: true

    computed:
      id:      -> @club.id
      version: -> @club.banner?.version
      path:    -> if @version then "clubs/#{@id}/banner?v=#{@version}" else ''
</script>


<style lang="less" scoped>
  .club-banner{
    height: 200px;
  }
</style>