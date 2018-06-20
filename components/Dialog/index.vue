<template lang="jade">
   .Dialog
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

         > .close {
            position: absolute;
            top: 0;
            right: 0;
            width: 64px;
            height: 64px;
            background-image: url(~/assets/images/close_white.png);
            background-repeat: no-repeat;
            background-position: center;
            background-size: 28px;
            opacity: 0.5;
            cursor: pointer;

            &:hover {
               opacity: 1;
            }
         }
      }
   }
</style>