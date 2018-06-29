<template lang="jade">
   #examples_SubjectDesc
      SubjectDesc(:subject="subject1")
      SubjectDesc(:subject="subject2")
</template>



<script lang="coffee">

   mocks = require('../mocks')

   module.exports =
      components:
         'SubjectDesc': require('~/components/SubjectDesc').default

      data: ->
         subject1: mocks.subjects[0]
         subject2: mocks.subjects[1]
</script>