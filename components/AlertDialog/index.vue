<template lang="jade">
   Dialog.AlertDialog(:open="open" @close="close")
      TextArea(:text="text")
      button(slot="action" @click="close") OK
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
         close: ->
            @$emit('close')
</script>