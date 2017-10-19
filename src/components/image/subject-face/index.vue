<template lang="jade">
  cdn-image.subject-face(:path="path", :ratio="ratio", :square="square" cover @click="click")
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
      'prevent':
        type: Boolean
        default: false

    computed:
      id:      -> @subject.id
      width:   -> @subject.face?.width
      height:  -> @subject.face?.height
      version: -> @subject.face?.version
      path:    -> if @version then "subjects/#{@id}/face?v=#{@version}" else ''
      ratio:   -> if @height and @width then @height / @width else 1

    methods:
      click: ->
        if @prevent
          @$emit('click')
        else
          @toSubjectPage(@subject)
</script>


<style lang="less" scoped>
  .subject-face{
    cursor: pointer;
  }
</style>
