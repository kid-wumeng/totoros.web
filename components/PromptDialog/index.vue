<template lang="jade">
   Dialog.PromptDialog(:open="open" @close="close")
      TextArea(:text="text")
      Input(v-model="input")
      button(slot="action" @click="close") Cancal
      button(slot="action" @click="ok")    OK
</template>



<script lang="coffee">
   module.exports =

      components:
         'Dialog':   require('~/components/Dialog').default
         'TextArea': require('~/components/TextArea').default
         'Input':    require('~/components/Input').default

      props:
         'open':
            type: Boolean
            default: false
         'text':
            type: String
            default: ''
         'defaults':
            type: String
            default: ''

      data: ->
         input: @defaults

      methods:
         ok: ->
            @$emit('ok', @input)

         close: ->
            @$emit('close')
</script>



<style lang="less">
   .PromptDialog {
      .Area {
         width: 360px;
         min-height: 0;

         .Input {
            width: 100%;
         }
      }
   }
</style>