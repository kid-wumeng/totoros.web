<template lang="jade">
  cdn-image.subject-face(:path="path", cover, :style="style")
</template>


<script lang="coffee">
  module.exports =
    components:
      'cdn-image': require('components/image/cdn-image')

    props:
      'subject':
        type: Object
        required: true
      'square':
        type: Boolean
        default: false

    data: ->
      width: 0

    computed:
      path: ->
        return "subjects/#{@subject?.id}/face?v=#{@subject?.face?.version}"

      ratio: ->
        w = @subject?.face?.width
        h = @subject?.face?.height
        if w and h
          return h / w
        else
          return 1.5

      height: ->
        if @square
          return @width
        else
          return parseInt(@width * @ratio)

      style: ->
        height: @height + 'px'

    mounted: ->
      @width = @$el.offsetWidth
</script>


<style lang="less" scoped>
  .subject-face{
    cursor: pointer;
  }
</style>
