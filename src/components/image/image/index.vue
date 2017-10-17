<template lang="jade">
  .image(v-if="url", :style="style")
  .image.default(v-else, :style="defaultStyle")
  //- .image(v-if="url", v-lazy:background-image="url", :style="style")
  //- .image.default(v-else, v-lazy:background-image="defaultUrl", :style="{'backgroundSize': 'contain'}")
</template>


<script lang="coffee">
  module.exports =
    props:
      'url':
        type: String
        required: true
      'cover':
        type: Boolean
        default: false

    computed:
      defaultUrl: ->
        return "#{@cdn}/assets/default-image?2017-10-07"

      style: ->
        backgroundImage: "url(#{@url})"
        backgroundSize: if @cover then 'cover' else 'contain'

      defaultStyle: ->
        backgroundImage: "url(#{@defaultUrl})"
</script>


<style lang="less" scoped>
  .image{
    background-position: center;
    background-repeat: no-repeat;
    overflow: hidden;
  }
  .image.default{
    background-size: contain;
    opacity: 0.6;
  }
</style>
