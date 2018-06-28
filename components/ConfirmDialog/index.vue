<template lang="jade">
   Dialog.ConfirmDialog(@close="close")
      TextArea(:text="text")
      button(slot="action" @click="close") NO
      button(slot="action" @click="sure")  YES
</template>



<script lang="coffee">
   module.exports =

      components:
         'Dialog':   require('~/components/Dialog').default
         'TextArea': require('~/components/TextArea').default

      props:
         'text':
            type: String
            default: ''

      methods:
         close: -> @$emit('close')
         sure:  -> @$emit('sure')
</script>