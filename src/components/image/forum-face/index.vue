<template lang="jade">
  cdn-image.forum-face(:path="path", square :radius="3" cover)
</template>


<script lang="coffee">
  module.exports =
    components:
      'cdn-image': require('components/image/cdn-image')

    props:
      'forum':
        type: Object
        required: true
      'prevent':
        type: Boolean
        default: false

    computed:
      id:      -> @forum.id
      version: -> @forum.face?.version
      path:    -> if @version then "forums/#{@id}/face?v=#{@version}" else ''

    methods:
      click: ->
        if @prevent
          @$emit('click')
        else
          @toforumPage(@forum)
</script>


<style lang="less" scoped>
  .forum-face{
  }
</style>