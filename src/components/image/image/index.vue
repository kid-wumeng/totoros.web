<template lang="jade">
  .image
    .bg-image(v-if="url", :style="style")
    .bg-image.default(v-else, :style="style")
  //- .image(v-if="url", v-lazy:background-image="url", :style="style")
  //- .image.default(v-else, v-lazy:background-image="defaultUrl", :style="{'backgroundSize': 'contain'}")
</template>


<script lang="coffee">
  module.exports =
    components:
      'load-trigger': require('./load-trigger')

    props:
      'url':
        type: String
        required: true
      'defaultUrl':
        type: String
        default: ''
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
        backgroundImage: if @useUrl then "url(#{@useUrl})" else undefined
        backgroundSize:  if @cover  then 'cover'           else 'contain'
        borderRadius:    if @circle then '100%'            else "#{@radius}px"
</script>


<style lang="less" scoped>
  .image{
    .bg-image{
      width: 100%;
      height: 100%;
      box-sizing: border-box;
      background-position: center;
      background-repeat: no-repeat;
      overflow: hidden;
    }
  }
</style>
