<template lang="jade">
   Dialog.AlertDialog(:open="open" @close="close")
      Area
         .text(v-html="textBr")
         Row(x="right")
            Button(text="OK" @click="close")
</template>



<script lang="coffee">
   module.exports =

      components:
         'Dialog': require('~/components/Dialog').default
         'Area':   require('~/components/Area').default
         'Row':    require('~/components/Row').default
         'Button': require('~/components/Button').default

      props:
         'open':
            type: Boolean
            default: false
         'text':
            type: String
            default: ''

      computed:
         textBr: ->
            return @text.trim().replace(/\n/g, '<br/>')

      methods:
         close: ->
            @$emit('close')
</script>



<style lang="less">

   @padding: 24px;

   .AlertDialog {
      .Area {
         min-width: 200px;
         max-width: 600px;
         padding: @padding;
         .text {
            line-height: 1.7;
            text-align: justify;
            text-indent: 2em;
            font-size: 14px;
            color: #273340;
         }
         .Row {
            margin-top: @padding * 1.5;
         }
      }
   }
</style>