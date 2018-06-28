<template lang="jade">
   #examples_MarkDialog
      Button(text="Mark ( 创建 )", @click="click_create")
      Button(text="Mark ( 修改 )", @click="click_update")
      MarkDialog(
         v-if="open",
         :subject="subject",
         :mark="mark",
         :default-step="3"
         @cancel="cancel"
         @remove="remove"
         @update="update"
         @create="create"
      )
</template>



<script lang="coffee">

   mocks = require('../mocks')

   module.exports =

      components:
         'MarkDialog': require('~/components/MarkDialog').default
         'Button':     require('~/components/Button').default

      data: ->
         open:    false
         subject: mocks.subject
         mark:    mocks.mark

      methods:
         click_create: ->
            @mark = null
            @open = true

         click_update: ->
            @mark = mocks.mark
            @open = true

         cancel: ->
            @open = false

         remove: ->
            alert('remove')
            @open = false

         update: (data) ->
            alert('update: ' + JSON.stringify(data))
            @open = false

         create: (data) ->
            alert('create: ' + JSON.stringify(data))
            @open = false
</script>