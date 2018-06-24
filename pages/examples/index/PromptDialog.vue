<template lang="jade">
   #examples_PromptDialog
      Button(text="Prompt", @click="open = true")
      PromptDialog(:open="open", :text="text", :defaults="defaults" @ok="ok" @close="open = false")
</template>



<script lang="coffee">
   module.exports =

      components:
         'PromptDialog': require('~/components/PromptDialog').default
         'Button':       require('~/components/Button').default

      data: ->
         open: false
         text: '你的名字？'
         defaults: 'KID'

      methods:
         ok: ( text ) ->
            alert(text)
            @open = false
</script>