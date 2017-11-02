<template lang="jade">
  .person-face(@click="click")
    photo-frame(v-if="frame")
      cdn-image(:path="path", :ratio="ratio", :square="square", :radius="radius", :circle="circle" cover)
    cdn-image(v-else :path="path", :ratio="ratio", :square="square", :radius="radius", :circle="circle" cover)
</template>


<script lang="coffee">
  module.exports =
    components:
      'photo-frame': require('components/@/photo-frame')
      'cdn-image':   require('components/image/cdn-image')

    props:
      'person':
        type: Object
        required: true
      'square':
        type: Boolean
        default: false
      'circle':
        type: Boolean
        default: false
      'frame':
        type: Boolean
        default: false
      'prevent':
        type: Boolean
        default: false

    computed:
      id:      -> @person.id
      width:   -> @person.face?.width
      height:  -> @person.face?.height
      version: -> @person.face?.version
      path:    -> if @version then "persons/#{@id}/face?v=#{@version}" else ''
      ratio:   -> if @height and @width then @height / @width else 1
      radius:  -> if @square then 3 else 0

    methods:
      click: ->
        if @prevent
          @$emit('click')
        else
          @toRolePage(@person)
</script>


<style lang="less" scoped>
  .person-face{
    box-sizing: border-box;
    cursor: pointer;
  }
</style>