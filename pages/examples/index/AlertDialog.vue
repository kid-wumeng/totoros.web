<template lang="jade">
   #examples_AlertDialog
      Button(text="Alert", @click="click")
      AlertDialog(v-if="open", :text="text" @close="close")
</template>



<script lang="coffee">
   module.exports =

      components:
         'AlertDialog': require('~/components/AlertDialog').default
         'Button':      require('~/components/Button').default

      data: ->
         open: false
         text: '注册失败：昵称已被别人占用'

      methods:
         click: -> @open = true
         close: -> @open = false
</script>