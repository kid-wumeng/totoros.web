<template lang="jade">
   #examples_PromptDialog
      Button(text="Prompt", @click="click")
      PromptDialog(v-if="open", :text="text", :defaults="defaults" @close="close" @sure="sure")
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
         click: -> @open = true
         close: -> @open = false

         sure: ( text ) ->
            alert(text)
            @open = false
</script>