<template lang="jade">
  cdn-image.organization-face(:path="path", :ratio="ratio", :square="square" cover)
</template>


<script lang="coffee">
  module.exports =
    components:
      'cdn-image': require('components/image/cdn-image')

    props:
      'organization':
        type: Object
        required: true
      'square':
        type: Boolean
        default: false

    computed:
      id:      -> @organization.id
      width:   -> @organization.face?.width
      height:  -> @organization.face?.height
      version: -> @organization.face?.version
      path:    -> if @version then "organizations/#{@id}/face?v=#{@version}" else ''
      ratio:   -> if @height and @width then @height / @width else 1
</script>


<style lang="less" scoped>
  .organization-face{
    cursor: pointer;
  }
</style>
