<template lang="jade">
   #examples_Dialog
      Button(text="Dialog" @click="open = true")
      Dialog(:open="open"  @close="open = false")
         TextArea(:text="text")
         button(slot="action" @click="open = false") action1
         button(slot="action" @click="open = false") action2
</template>



<script lang="coffee">
   module.exports =
      components:
         'Dialog':   require('~/components/Dialog').default
         'Button':   require('~/components/Button').default
         'TextArea': require('~/components/TextArea').default

      data: ->
         open: false
         text: '这是一个 Dialog 对话框！'
</script>