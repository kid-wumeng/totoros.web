<template lang="jade">
   #examples_SearchDialog
      Button(text="Search", @click="click")
      SearchDialog(v-if="open", :subjects="subjects" @close="close")
</template>



<script lang="coffee">

   mocks = require('../mocks')

   module.exports =

      components:
         'SearchDialog': require('~/components/SearchDialog').default
         'Button':       require('~/components/Button').default

      data: ->
         open:     true
         subjects: mocks.subjects

      methods:
         click: ->
            @open = true

         close: ->
            @open = false
</script>