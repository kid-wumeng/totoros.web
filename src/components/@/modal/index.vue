<template lang="jade">
  c-animate(enter="flipInX" leave="flipOutX")
   .modal.-center(:style="style")
      slot
      .icon.fa-close(v-if="!hideClose" @click="$emit('close')")
</template>


<script lang="coffee">
  module.exports =
    components:
      'c-animate': require('components/@/animate')

    props:
      'zIndex':
        type: Number
        default: 10
      'hideClose':
        type: Boolean
        default: false

    computed:
      style: ->
        'zIndex': @zIndex
</script>


<style lang="less" scoped>
  .modal{
    position: fixed;
    top: 0;
    left: 0;
    width: 100%;
    height: 100%;
    background-color: rgba(255, 255, 255, 1);
    animation-duration: 0.8s;
    .icon{
      position: absolute;
      top: 24px;
      right: 34px;
      font-size: 48px;
      font-weight: 100;
      color: #545E75;
      cursor: pointer;
    }
  }
</style>
