<template lang="jade">
  .image(v-lazy:background-image="url", :style="style")
</template>


<script lang="coffee">
  module.exports =
    props:
      'path':
        type: String
        required: true
      'cover':
        type: Boolean
        default: false

    data: ->
      cdn: if window.dev then 'http://omdg5dewm.bkt.clouddn.com' else 'http://cdn.orz-world.com'

    computed:
      url: ->
        return "#{@cdn}/#{@path}"

      style: ->
        backgroundSize: if @cover then 'cover' else 'contain'
</script>


<style lang="less" scoped>
  .image{
    background-position: center;
    background-repeat: no-repeat;
    overflow: hidden;
  }
</style>
