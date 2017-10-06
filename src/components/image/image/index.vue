<template lang="jade">
  .image(v-if="url", v-lazy:background-image="url", :style="style")
  .image(v-else, v-lazy:background-image="defaultUrl", :style="{'backgroundSize': 'contain'}")
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
    background-position: center;
    background-repeat: no-repeat;
    overflow: hidden;
  }
</style>
