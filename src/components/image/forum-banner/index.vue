<template lang="jade">
  cdn-image.forum-banner(:path="path" cover @click="$emit('click')")
</template>


<script lang="coffee">
  module.exports =
    components:
      'cdn-image': require('components/image/cdn-image')

    props:
      'forum':
        type: Object
        required: true

    computed:
      id:      -> @forum.id
      version: -> @forum.banner?.version
      path:    -> if @version then "forums/#{@id}/banner?v=#{@version}" else ''
</script>


<style lang="less" scoped>
  .forum-banner{
    height: 200px;
  }
</style>