<template lang="jade">
  .file-select
    .wrap(@click="show")
      slot

    input(
      ref="input",
      type="file",
      accept="image/png, image/jpeg",
      :multiple="multiple"
      @change="change"
    )
</template>


<script lang="coffee">
  module.exports =
    props:
      'max':
        type: Number
        default: 2 * 1024 * 1024
      'multiple':
        type: Boolean
        default: false

    methods:
      show: ->
        @$refs.input.click()

      change: (event) ->
        try
          files = event.target.files
          @check(files)

          if @multiple
            @$emit('select', files)
          else
            @$emit('select', files[0])

        catch error
          @notify('warn', error, 3000)

      check: (files) ->
        for file in files
          if file.size > @max
            throw "请选择小于#{@max/1024/1024}MB的图片"
</script>


<style lang="less" scoped>
  .file-select{
    display: inline-block;
    .wrap{
      display: block;
      cursor: pointer;
    }
    input{
      display: none;
    }
  }
</style>