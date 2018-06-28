<template lang="jade">
   #examples_ConfirmDialog
      Button(text="Confirm", @click="click")
      ConfirmDialog(v-if="open", :text="text" @close="close" @sure="sure")
</template>



<script lang="coffee">
   module.exports =

      components:
         'ConfirmDialog': require('~/components/ConfirmDialog').default
         'Button':        require('~/components/Button').default

      data: ->
         open: false
         text: '你真的要登出吗？'

      methods:
         click: -> @open = true
         close: -> @open = false

         sure:  ->
            alert('YES')
            @open = false
</script>