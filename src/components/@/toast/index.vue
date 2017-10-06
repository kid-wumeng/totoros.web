<template lang="jade">
  c-animate(enter="fadeInDown" leave="fadeOutUp")
    .toast(v-show="state.toast.open")
      .message {{ state.toast.message }}
</template>


<script lang="coffee">
  module.exports =
    components:
      'c-animate': require('components/@/animate')
</script>


<style lang="less" scoped>
  .toast{
    position: fixed;
    top: 35%;
    z-index: 10;
    animation-duration: 0.3s;
    .message{
      padding: 5px 14px;
      font-weight: 600;
      font-size: 13px;
      color: #FFF;
      background-color: rgba(0, 0, 0, 0.6);
      border-radius: 100px;
    }
  }
</style>
