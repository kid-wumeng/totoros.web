<template lang="jade">
.subject-face(@click="click")
  photo-frame(v-if="frame")
    cdn-image(:path="path", :ratio="ratio", :square="square" cover)
  cdn-image(v-else :path="path", :ratio="ratio", :square="square" cover)
</template>


<script lang="coffee">
  module.exports =
    components:
      'photo-frame': require('components/@/photo-frame')
      'cdn-image':   require('components/image/cdn-image')

    props:
      'subject':
        type: Object
        required: true
      'square':
        type: Boolean
        default: false
      'frame':
        type: Boolean
        default: false
      'fixedHeight':
        type: Boolean
        default: false
      'prevent':
        type: Boolean
        default: false

    computed:
      id:      -> @subject.id
      width:   -> @subject.face?.width
      height:  -> @subject.face?.height
      version: -> @subject.face?.version
      path:    -> if @version then "subjects/#{@id}/face?v=#{@version}" else ''
      ratio:   ->
        if @fixedHeight
          return 1.45
        else
          if @height and @width
            return @height / @width
          else
            return 1

    methods:
      click: ->
        if @prevent
          @$emit('click')
        else
          @toSubjectPage(@subject)
</script>


<style lang="less" scoped>
  .subject-face{
    box-sizing: border-box;
    cursor: pointer;
  }
</style>
