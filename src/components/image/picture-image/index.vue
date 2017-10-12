<template lang="jade">
  cdn-image.picture-image(:path="path", :ratio="ratio", :square="square" cover @click="click")
</template>


<script lang="coffee">
  module.exports =
    components:
      'cdn-image': require('components/image/cdn-image')

    props:
      'picture':
        type: Object
        required: true
      'square':
        type: Boolean
        default: false
      'prevent':
        type: Boolean
        default: false

    computed:
      width:  -> @picture.image.width
      height: -> @picture.image.height
      path:   -> "pictures/#{@picture.hash}"
      ratio:  -> @height / @width


    methods:
      click: ->
        if not @prevent
          @toPicturePage(@picture)
</script>


<style lang="less" scoped>
  .picture-image{
    cursor: pointer;
  }
</style>
