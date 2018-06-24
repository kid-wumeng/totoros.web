<template lang="jade">
   #examples_AlertDialog
      Button(text="Alert", @click="open = true")
      AlertDialog(:open="open", :text="text" @close="open = false")
</template>



<script lang="coffee">
   module.exports =

      components:
         'AlertDialog': require('~/components/AlertDialog').default
         'Button':      require('~/components/Button').default

      data: ->
         open: false
         text: '注册失败：昵称已被别人占用'
</script>