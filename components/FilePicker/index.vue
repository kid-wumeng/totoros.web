<template lang="jade">
   .FilePicker
      .wrap(@click="openPicker")
         slot

      input(
         ref="input",
         type="file",
         :accept="accept",
         :multiple="multiple"
         @change="change"
      )
</template>



<script lang="coffee">
   module.exports =


      props:
         'type':
            type: String
            required: true
            validator: (type) => ['userFace', 'subjectFace', 'image'].includes(type)


      computed:
         'accept': ->
            switch @type
               when 'userFace'    then 'image/png, image/jpeg'
               when 'subjectFace' then 'image/png, image/jpeg'
               when 'image'       then 'image/png, image/jpeg, image/gif, image/bmp, image/webp'

         'multiple': ->
            switch @type
               when 'userFace'    then false
               when 'subjectFace' then false
               when 'image'       then true

         'max': ->
            switch @type
               when 'userFace'    then 1 * 1024 * 1024
               when 'subjectFace' then 1 * 1024 * 1024
               when 'image'       then 5 * 1024 * 1024


      methods:
         openPicker: ->
            @$refs.input.click()


         change: (event) ->
            try
               files = event.target.files

               @testMax(files)

               if @multiple
                  @$emit('change', files)
               else
                  @$emit('change', files[0])

            catch error
               @$emit('error', error)


         testMax: (files) ->
            for file in files
               if file.size > @max
                  throw "请选择小于#{@max/1024/1024}MB的图片"
</script>



<style lang="less">
   .FilePicker {
      display: inline-block;

      .wrap{
         width: 100%;
         display: block;
         cursor: pointer;
      }

      input{
         display: none;
      }
   }
</style>