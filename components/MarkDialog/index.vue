<template lang="jade">
   Dialog.ConfirmDialog(:open="open" @close="close")
      TextArea(:text="text")
      button(slot="action" @click="close") NO
      button(slot="action" @click="ok")    YES
</template>



<script lang="coffee">
   module.exports =

      components:
         'Dialog':   require('~/components/Dialog').default
         'TextArea': require('~/components/TextArea').default

      props:
         'open':
            type: Boolean
            default: false
         'text':
            type: String
            default: ''

      methods:
         ok: ->
            @$emit('ok')

         close: ->
            @$emit('close')
</script>