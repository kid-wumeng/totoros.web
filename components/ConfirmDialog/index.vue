<template lang="jade">
   Dialog.ConfirmDialog(:open="open" @close="close")
      Area
         TextArea(:text="text")
         Row(x="right" y="center")
            .button(@click="close") NO
            .button(@click="close") YES
</template>



<script lang="coffee">
   module.exports =

      components:
         'Dialog':   require('~/components/Dialog').default
         'Area':     require('~/components/Area').default
         'TextArea': require('~/components/TextArea').default
         'Row':      require('~/components/Row').default

      props:
         'open':
            type: Boolean
            default: false
         'text':
            type: String
            default: ''

      methods:
         close: ->
            @$emit('close')
</script>



<style lang="less">

   @padding: 24px;

   .ConfirmDialog {
      .Area {
         min-width: 320px;
         max-width: 640px;

         .TextArea {
            padding: @padding - 6px @padding;
            min-height: 100px;
         }

         .Row {
            padding: @padding - 6px @padding;
            border-top: 1px solid #F6F6F6;

            .button {
               margin-left: @padding;
               padding: 4px;
               font-weight: 400;
               font-size: 14px;
               color: #A2AEBA;
               user-select: none;
               transition: color 0.2s ease;

               &:hover {
                  color: #445669;
               }
            }
         }
      }
   }
</style>