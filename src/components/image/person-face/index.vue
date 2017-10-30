<template lang="jade">
  cdn-image.person-face(:class="imageClass", :path="path", :ratio="ratio", :square="square" cover @click="click")
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
      'border':
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

      imageClass: ->
        '-square': '-square'
        '-border': '-border'

    methods:
      click: ->
        if @prevent
          @$emit('click')
        else
          @toPersonPage(@person)
</script>


<style lang="less" scoped>
  .person-face{
    box-sizing: border-box;
    cursor: pointer;
  }
  .person-face.-square{
    border-radius: 3px;
  }
  .person-face.-border{
    border: 1px solid #EEF3F8;
  }
</style>
