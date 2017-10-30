<template lang="jade">
  cdn-image.organization-face(:class="imageClass", :path="path", :ratio="ratio", :square="square" cover @click="click")
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
      'border':
        type: Boolean
        default: false
      'prevent':
        type: Boolean
        default: false

    computed:
      id:      -> @organization.id
      width:   -> @organization.face?.width
      height:  -> @organization.face?.height
      version: -> @organization.face?.version
      path:    -> if @version then "organizations/#{@id}/face?v=#{@version}" else ''
      ratio:   -> if @height and @width then @height / @width else 1

      imageClass: ->
        '-square': '-square'
        '-border': '-border'

    methods:
      click: ->
        if @prevent
          @$emit('click')
        else
          @toOrganizationPage(@organization)
</script>


<style lang="less" scoped>
  .organization-face{
    box-sizing: border-box;
    cursor: pointer;
  }
  .organization-face.-square{
    border-radius: 3px;
  }
  .organization-face.-border{
    border: 1px solid #EEF3F8;
  }
</style>
