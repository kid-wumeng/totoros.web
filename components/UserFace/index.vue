<template lang="jade">
   ImageCDN.UserFace(:path="path", :ratio="1", :class="faceClass" @click="click")
</template>



<script lang="coffee">
   module.exports =

      components:
         'ImageCDN': require('~/components/ImageCDN').default

      props:
         'user':
            type: Object
            default: null

         'circle':
            type: Boolean
            default: false

      computed:
         id:  -> @user?.id
         ver: -> @user?.face?.ver

         path: ->
            if @id and @ver
               return "users/#{@id}/face?ver=#{@ver}"
            else
               return ''

         faceClass: ->
            '-circle': @circle

      methods:
         click: ->
            @$router.push("/users/#{@id}")
</script>



<style lang="less">
   .UserFace {
      background-color: #F6F6F6;
      border-radius: 3px;
      cursor: pointer;
   }

   .UserFace.-circle {
      border-radius: 100%;
   }
</style>