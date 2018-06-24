<template lang="jade">
   #examples_ConfirmDialog
      Button(text="Confirm", @click="open = true")
      ConfirmDialog(:open="open", :text="text" @close="open = false")
</template>



<script lang="coffee">
   module.exports =

      components:
         'ConfirmDialog': require('~/components/ConfirmDialog').default
         'Button':        require('~/components/Button').default

      data: ->
         open: true
         text: '你真的要登出吗？'
</script>