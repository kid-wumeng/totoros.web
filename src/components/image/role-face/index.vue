<template lang="jade">
  .role-face
    photo-frame(v-if="frame")
      cdn-image(:path="path", :ratio="ratio", :square="square", :radius="radius", :circle="circle", :cover="cover" @click="click")
    cdn-image(v-else :path="path", :ratio="ratio", :square="square", :radius="radius", :circle="circle", :cover="cover" @click="click")
</template>


<script lang="coffee">
  module.exports =
    components:
      'photo-frame': require('components/@/photo-frame')
      'cdn-image':   require('components/image/cdn-image')

    props:
      'role':
        type: Object
        required: true
      'square':
        type: Boolean
        default: false
      'circle':
        type: Boolean
        default: false
      'cover':
        type: Boolean
        default: true
      'frame':
        type: Boolean
        default: false
      'prevent':
        type: Boolean
        default: false

    computed:
      id:      -> @role.id
      width:   -> @role.face?.width
      height:  -> @role.face?.height
      version: -> @role.face?.version
      path:    -> if @version then "roles/#{@id}/face?v=#{@version}" else ''
      ratio:   -> if @height and @width then @height / @width else 1
      radius:  -> if @square then 3 else 0

    methods:
      click: ->
        if @prevent
          @$emit('click')
        else
          @toRolePage(@role)
</script>


<style lang="less" scoped>
  .role-face{
    box-sizing: border-box;
    cursor: pointer;
  }
</style>
