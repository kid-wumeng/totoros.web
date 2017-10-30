<template lang="jade">
  cdn-image.role-face(:class="imageClass", :path="path", :ratio="ratio", :square="square" cover @click="click")
</template>


<script lang="coffee">
  module.exports =
    components:
      'cdn-image': require('components/image/cdn-image')

    props:
      'role':
        type: Object
        required: true
      'square':
        type: Boolean
        default: false
      'border':
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

      imageClass: ->
        '-square': '-square'
        '-border': '-border'

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
  .role-face.-square{
    border-radius: 3px;
  }
  .role-face.-border{
    border: 1px solid #EEF3F8;
  }
</style>
