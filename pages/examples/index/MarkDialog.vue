<template lang="jade">
   #examples_MarkDialog
      Button(text="Mark ( 创建 )", @click="click1")
      Button(text="Mark ( 修改 )", @click="click2")
      MarkDialog(v-if="open", :mark="mark", :subject="subject" @sure="sure" @close="close")
</template>



<script lang="coffee">

   mocks = require('../mocks')

   module.exports =

      components:
         'MarkDialog': require('~/components/MarkDialog').default
         'Button':     require('~/components/Button').default

      data: ->
         open:    true
         mark:    mocks.mark
         subject: mocks.subject

      methods:
         click1: ->
            @open = true
            @mark = null

         click2: ->
            @mark = mocks.mark
            @open = true

         sure: ->
            @open = false

         close: ->
            @open = false
</script>