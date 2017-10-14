<template lang="jade">
  cdn-image.person-face(:path="path", :ratio="ratio", :square="square" cover)
</template>


<script lang="coffee">
  module.exports =
    components:
      'cdn-image': require('components/image/cdn-image')

    props:
      'person':
        type: Object
        required: true
      'square':
        type: Boolean
        default: false

    computed:
      id:      -> @person.id
      width:   -> @person.face?.width
      height:  -> @person.face?.height
      version: -> @person.face?.version
      path:    -> if @version then "persons/#{@id}/face?v=#{@version}" else ''
      ratio:   -> if @height and @width then @height / @width else 1
</script>


<style lang="less" scoped>
  .person-face{
    cursor: pointer;
  }
</style>
