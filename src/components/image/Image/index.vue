<template lang="jade">
  .image(v-lazy:background-image="cdn(url)", :style="style")
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
