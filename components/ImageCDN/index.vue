<template lang="jade">
   .ImageCDN(:style="imageStyle", :class="imageClass") {{ path ? '' : alt }}
</template>



<script lang="coffee">
   module.exports =


      props:
         'path':
            type: String
            default: ''

         'alt':
            type: String
            default: ''

         'ratio':
            type: Number
            default: 0

         'cover':
            type: Boolean
            default: false


      data: ->
         'width': 0


      computed:
         src: ->
            if @path
               return @io.cdn(@path)
            else
               return ''


         height: ->
            return @width * @ratio


         imageStyle: ->

            style = {}

            if @src
               style['background-image'] = 'url(' + @src + ')'

            if @height
               style['height'] = @height + 'px'

            return style


         imageClass: ->
            '-cover': @cover


      mounted: ->
         @width = @$el.offsetWidth
</script>



<style lang="less">
   .ImageCDN {
      width: 100%;
      background-repeat: no-repeat;
      background-position: center;
      background-size: contain;
      display: flex;
      justify-content: center;
      align-items: center;
      text-align: justify;
      font-size: 12px;
      color: #999;
      user-select: none;
   }

   .ImageCDN.-cover {
      background-size: cover;
   }
</style>