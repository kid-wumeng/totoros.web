<template lang="jade">
   #examples_MarkDialog
      Button(text="Mark ( 创建 )", @click="click1")
      Button(text="Mark ( 修改 )", @click="click2")
      MarkDialog(:open="open", :mark="mark" @sure="sure" @close="close")
</template>



<script lang="coffee">

   mocks = require('../mocks')

   module.exports =

      components:
         'MarkDialog': require('~/components/MarkDialog').default
         'Button':     require('~/components/Button').default

      data: ->
         open: false
         mark: null

      methods:
         click1: ->
            @open = true
            @mark = null

         click2: ->
            @open = true
            @mark = mocks.mark

         sure: ->
            @open = false

         close: ->
            @open = false
</script>