<template lang="jade">
  c-image.cdn-image(:url="url", :default-url="defaultUrl", :radius="radius", :circle="circle", :cover="cover", :style="style", @click.native="$emit('click')")
</template>


<script lang="coffee">
  module.exports =
    components:
      'c-image': require('components/image/image')

    props:
      'path':
        type: String
        required: true
      'defaultPath':
        type: String
        default: 'assets/default-image?2017-10-07'
      'ratio':
        type: Number
        default: 0
      'square':
        type: Boolean
      'radius':
        type: Number
      'circle':
        type: Boolean
        default: false
      'cover':
        type: Boolean
        default: false

    data: ->
      width: 0

    computed:
      url: ->
        if(@width)
          if @path
            url = "#{@cdn}/#{@path}"
            url = @appendQuery(url, "imageView2/2/w/#{@width*@dpr}")
            return url
          else
            return ''
        else
          return ''

      defaultUrl: ->
        return "#{@cdn}/#{@defaultPath}"

      height: ->
        if @square or @circle
          return @width
        else
          return parseInt(@width * @ratio)

      style: ->
        if @height
          return{ height: @height + 'px' }
        else
          return {}

    mounted: ->
      @width = @$el.offsetWidth

    methods:
      appendQuery: (url, key) ->
        if(url.indexOf('?') > -1)
          return url + "&#{key}"
        else
          return url + "?#{key}"
</script>


<style lang="less" scoped>
</style>