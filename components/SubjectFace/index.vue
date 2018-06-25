<template lang="jade">
   ImageCDN.SubjectFace(:path="path", :ratio="ratio")
</template>



<script lang="coffee">
   module.exports =

      components:
         'ImageCDN': require('~/components/ImageCDN').default

      props:
         'subject':
            type: Object
            default: null

         'auto':
            type: Boolean
            default: false

      computed:
         id:     -> @subject?.id
         ver:    -> @subject?.face?.ver
         width:  -> @subject?.face?.width
         height: -> @subject?.face?.height

         path: ->
            if @id and @ver
               return "subjects/#{@id}/face?ver=#{@ver}"
            else
               return ''

         ratio: ->
            if @auto and @width and @height
               return @height / @width
            else
               return 1.45
</script>



<style lang="less">
   .SubjectFace {
      background-color: #FBFBFB;
   }
</style>