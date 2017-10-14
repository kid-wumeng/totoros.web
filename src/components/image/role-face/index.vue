<template lang="jade">
  cdn-image.role-face(:path="path", :ratio="ratio", :square="square" cover)
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

    computed:
      id:      -> @role.id
      width:   -> @role.face?.width
      height:  -> @role.face?.height
      version: -> @role.face?.version
      path:    -> if @version then "roles/#{@id}/face?v=#{@version}" else ''
      ratio:   -> if @height and @width then @height / @width else 1
</script>


<style lang="less" scoped>
  .role-face{
    cursor: pointer;
  }
</style>
