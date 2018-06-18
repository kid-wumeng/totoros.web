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

         'cover':
            type: Boolean
            default: false


      computed:
         'src': ->
            if @path
               return @io.cdn(@path)
            else
               return ''

         'imageStyle': ->
            if @src
               return {'background-image': 'url(' + @src + ')'}
            else
               return {}

         'imageClass': ->
            '-cover': @cover
</script>



<style lang="less">
   .ImageCDN {
      width: 100%;
      height: 100%;
      background-repeat: no-repeat;
      background-position: center;
      background-size: contain;
      display: flex;
      justify-content: center;
      align-items: center;
      padding: 24px;
      text-align: justify;
      font-size: 12px;
      color: #999;
   }

   .ImageCDN.-cover {
      background-size: cover;
   }
</style>