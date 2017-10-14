<template lang="jade">
  c-image.cdn-image(:url="url", :cover="cover", :style="style")
</template>


<script lang="coffee">
  module.exports =
    components:
      'c-image': require('components/image/image')

    props:
      'path':
        type: String
        required: true
      'ratio':
        type: Number
        default: 0
      'square':
        type: Boolean
        default: false
      'cover':
        type: Boolean
        default: false

    data: ->
      width: 0

    computed:
      url: ->
        return if @path then "#{@cdn}/#{@path}" else ''

      height: ->
        if @square
          return @width
        else
          return parseInt(@width * @ratio)

      style: ->
        if @height
          return{ height: @height + 'px' }
        else
          return {}

    mounted: ->
      @width = @$el.offsetWidth
</script>


<style lang="less" scoped>
</style>