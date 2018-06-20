<template lang="jade">
   .Dialog
      transition(name="fade")
         .mask(v-if="open" @click.self="close")
            slot
            .close(@click="close")
</template>



<script lang="coffee">
   module.exports =

      props:
         'open':
            type: Boolean
            default: false

      methods:
         close: ->
            @$emit('close')
</script>



<style lang="less">

   @close-size: 28px;

   .Dialog {
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
            top:    @close-size;
            right:  @close-size;
            width:  @close-size;
            height: @close-size;
            background-image: url(~/assets/images/close_white.png);
            background-repeat: no-repeat;
            background-position: center;
            background-size: contain;
            opacity: 0.6;
         }
      }
   }

   .Dialog {
      .mask.fade-enter,
      .mask.fade-leave-to {
         opacity: 0;
      }
   }
</style>