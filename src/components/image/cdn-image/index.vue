<template lang="jade">
  c-image.cdn-image(:url="url", :cover="cover")
</template>


<script lang="coffee">
  module.exports =
    components:
      'c-image': require('components/image/image')

    props:
      'path':
        type: String
        required: true
      'cover':
        type: Boolean
        default: false

    computed:
      url: -> if @path then "#{@cdn}/#{@path}" else ''
</script>


<style lang="less" scoped>
</style>
