<template lang="jade">
  .image(v-if="url", v-lazy:background-image="url", :style="style")
  .image.default(v-else, v-lazy:background-image="defaultUrl", :style="{'backgroundSize': 'contain'}")
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
        backgroundSize: if @cover then 'cover' else 'contain'
</script>


<style lang="less" scoped>
  .image{
    width: 100%;
    height: 100%;
    background-position: center;
    background-repeat: no-repeat;
    background-color: rgba(255, 255, 255, 1);
    overflow: hidden;
  }
  .image.default{
    opacity: 0.6;
  }
</style>
