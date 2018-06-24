<template lang="jade">
   Dialog.AlertDialog(:open="open" @close="close")
      Area
         TextArea(:text="text")
         Row(x="right")
            Button(text="OK" @click="close")
</template>



<script lang="coffee">
   module.exports =

      components:
         'Dialog':   require('~/components/Dialog').default
         'Area':     require('~/components/Area').default
         'TextArea': require('~/components/TextArea').default
         'Row':      require('~/components/Row').default
         'Button':   require('~/components/Button').default

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

   .AlertDialog {
      .Area {
         min-width: 360px;
         max-width: 640px;
         padding: @padding;
         .Row {
            margin-top: @padding * 1.5;
         }
      }
   }
</style>