<template lang="jade">
   .Modal
      transition(name="fade")
         .mask(v-if="open" @click.self="close")
            slot
            .close(v-if="!hideClose" @click="close")
</template>



<script lang="coffee">
   module.exports =

      props:
         'open':
            type: Boolean
            default: false

         'hideClose':
            type: Boolean
            default: false

      methods:
         close: ->
            @$emit('close')
</script>



<style lang="less">

   @close-size: 28px;

   .Modal {
      .mask {
         position: fixed;
         left: 0;
         top: 0;
         width: 100%;
         height: 100%;
         background-color: rgba(68, 86, 105, 0.6);
         display: flex;
         justify-content: center;
         align-items: center;
         transition: opacity 0.5s ease;

         .close {
            position: absolute;
            right: 0;
            top: 0;
            width:  @close-size * 3;
            height: @close-size * 3;
            background-image: url(~/assets/images/close_white.png);
            background-repeat: no-repeat;
            background-position: center;
            background-size: @close-size;
            opacity: 0.6;
         }
      }
   }

   .Modal {
      .mask.fade-enter,
      .mask.fade-leave-to {
         opacity: 0;
      }
   }
</style>