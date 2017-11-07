<template lang="jade">
  cdn-image.club-face(:path="path", square :radius="3" cover @click="click")
</template>


<script lang="coffee">
  module.exports =
    components:
      'cdn-image': require('components/image/cdn-image')

    props:
      'club':
        type: Object
        required: true
      'prevent':
        type: Boolean
        default: false

    computed:
      id:      -> @club.id
      version: -> @club.face?.version
      path:    -> if @version then "clubs/#{@id}/face?v=#{@version}" else ''

    methods:
      click: ->
        if @prevent
          @$emit('click')
        else
          @toClubPage(@club)
</script>


<style lang="less" scoped>
  .club-face{
  }
</style>