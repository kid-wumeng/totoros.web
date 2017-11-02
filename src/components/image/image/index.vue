<template lang="jade">
  .image(v-if="url", :style="style")
  .image.default(v-else, :style="style")
  //- .image(v-if="url", v-lazy:background-image="url", :style="style")
  //- .image.default(v-else, v-lazy:background-image="defaultUrl", :style="{'backgroundSize': 'contain'}")
</template>


<script lang="coffee">
  module.exports =
    props:
      'url':
        type: String
        required: true
      'defaultUrl':
        type: String
        required: true
      'radius':
        type: Number
        default: 0
      'circle':
        type: Boolean
        default: false
      'cover':
        type: Boolean
        default: false

    computed:
      useUrl: -> if @url then @url else @defaultUrl

      style: ->
        backgroundImage: "url(#{@useUrl})"
        backgroundSize: if @cover  then 'cover' else 'contain'
        borderRadius:   if @circle then '100%'  else "#{@radius}px"
</script>


<style lang="less" scoped>
  .image{
    box-sizing: border-box;
    background-position: center;
    background-repeat: no-repeat;
    overflow: hidden;
  }
  .image.default{
    border: 1px solid #EEF3F8;
  }
</style>
