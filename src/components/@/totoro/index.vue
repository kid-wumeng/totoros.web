<template lang="jade">
  .totoro
    c-animate(enter="zoomIn" leave="zoomOut")
      .message(v-show="state.totoro.open") {{ state.totoro.message }}
    cdn-image.face(path="assets/totoro?2017-09-30")
</template>


<script lang="coffee">
  module.exports =
    components:
      'c-animate': require('components/@/animate')
      'cdn-image': require('components/image/cdn-image')

    computed:
      style: ->
        'background-image': @url('assets/totoro-face?2017-09-30')
</script>


<style lang="less" scoped>
  .totoro{
    position: fixed;
    right: 100px;
    bottom: 100px;
    display: flex;
    flex-direction: column;
    align-items: flex-end;

    .message{
      align-self: flex-start;
      flex: none;
      margin-right: 65px;
      margin-bottom: -4px;
      box-sizing: border-box;
      padding: 16px 21px 15px 20px;
      font-weight: 500;
      font-size: 14px;
      color: #4D4B5E;
      background-color: #FBFBFB;
      border: 1px solid rgba(184, 197, 214, 0.2);
      border-radius: 50px 50px 0 50px;
      box-shadow: 0 1px 4px rgba(0, 0, 0, 0.04);
      position: relative;
      animation-duration: 0.3s;
    }

    .face{
      width: 60px;
      height: 60px;
      border-radius: 100px;
    }
  }
</style>
