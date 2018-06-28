<template lang="jade">
   #examples_Read
      Read(:subject="subject")
</template>



<script lang="coffee">
   mocks = require('../mocks')
   
   module.exports =
      components:
         'Read': require('~/components/Read').default

      data: ->
         subject: mocks.subject
</script>