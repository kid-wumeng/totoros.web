<template lang="jade">
  c-animate(enter="fadeInDown" leave="fadeOutUp")
    .notify(v-show="state.notify.open")
      .row
        .icon.-center(:class="typeClass", :style="typeStyle")
        .message {{ state.notify.message }}
</template>


<script lang="coffee">
  module.exports =
    components:
      'c-animate': require('components/@/animate')

    computed:
      typeClass: ->
        'fa-check':       @state.notify.type is 'done'
        'fa-exclamation': @state.notify.type is 'warn'
        'fa-close':       @state.notify.type is 'fail'

      typeStyle: ->
        backgroundColor: @color

      color: ->
        switch @state.notify.type
          when 'done' then '#13CE66'
          when 'warn' then '#F7BA2A'
          when 'fail' then '#FF4949'
          else '#8492A6'
</script>


<style lang="less" scoped>
  .notify{
    position: fixed;
    top: 20px;
    animation-duration: 0.3s;
    .row{
      min-width: 300px;
      background-color: #FFF;
      border-radius: 2px;
      box-shadow: 0 2px 4px rgba(0, 0, 0, 0.12), 0 0 6px rgba(0, 0, 0, 0.04);
      .icon{
        width: 40px;
        height: 40px;
        font-size: 18px;
        color: #FFF;
      }
      .message{
        flex: auto;
        padding: 0 12px;
        font-weight: 500;
        color: #8391a5;
      }
    }
  }
</style>
