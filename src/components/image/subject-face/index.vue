<template lang="jade">
  cdn-image.subject-face(:path="path", :width="width", :height="height")
</template>


<script lang="coffee">
  module.exports =
    components:
      'cdn-image': require('components/image/cdn-image')

    props:
      'subject':
        type: Object
        required: true
      'width':
        type: Number
        default: 120
      'square':
        type: Boolean
        default: false

    computed:
      path: ->
        return "subjects/#{@subject?.id}/face?v=#{@subject?.face?.version}"

      ratio: ->
        if @subject?.face?.height and @subject?.face?.width
          return @subject?.face?.height / @subject?.face?.width
        else
          return 1.5

      height: ->
        if @square
          return @width
        else
          return parseInt(@width * @ratio)
</script>


<style lang="less" scoped>
  .subject-face{
    cursor: pointer;
  }
</style>
