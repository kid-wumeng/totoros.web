<template lang="jade">
   .ImageCDN(:style="imageStyle" @click="click") {{ path ? '' : alt }}
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

      mounted: ->
         @width = @$el.offsetWidth

      methods:
         click: ->
            @$emit('click')
</script>



<style lang="less">
   .ImageCDN {
      flex: none;
      width: 100%;
      background-repeat: no-repeat;
      background-position: center;
      background-size: cover;
      display: flex;
      justify-content: center;
      align-items: center;
      text-align: justify;
      font-size: 12px;
      color: #999;
      user-select: none;
   }
</style>