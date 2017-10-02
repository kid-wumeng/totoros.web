<template lang="jade">
  c-animate(enter="flipInX" leave="flipOutX")
   .modal.-center
      slot
      .icon.fa-close(@click="$emit('close')")
</template>


<script lang="coffee">
  module.exports =
    components:
      'c-animate': require('components/@/animate')
</script>


<style lang="less" scoped>
  .modal{
    position: fixed;
    top: 0;
    left: 0;
    width: 100%;
    height: 100%;
    background-color: rgba(255, 255, 255, 0.8);
    animation-duration: 0.8s;
    .icon{
      position: absolute;
      top: 30px;
      right: 40px;
      font-size: 48px;
      font-weight: 100;
      color: #545E75;
      cursor: pointer;
    }
  }
</style>
