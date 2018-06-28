<template lang="jade">
   #examples_MarkDialog
      Button(text="Mark 1", @click="click1")
      Button(text="Mark 2", @click="click2")
      MarkDialog(:subject="subject", :open="open" @ok="ok" @close="close")
</template>



<script lang="coffee">

   mocks = require('../mocks')

   module.exports =

      components:
         'MarkDialog': require('~/components/MarkDialog').default
         'Button':     require('~/components/Button').default

      data: ->
         open: false
         subject: null

      methods:
         click1: ->
            @subject = mocks.subjects[0]
            @open = true

         click2: ->
            @subject = mocks.subjects[1]
            @open = true

         ok: ->

         close: ->
            @open = false
</script>