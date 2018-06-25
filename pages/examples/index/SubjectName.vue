<template lang="jade">
   #examples_SubjectName
      SubjectName(:subject="subject1")
      SubjectName(:subject="subject2")
</template>



<script lang="coffee">

   mocks = require('../mocks')

   module.exports =
      components:
         'SubjectName': require('~/components/SubjectName').default

      data: ->
         subject1: mocks.subjects[0]
         subject2: mocks.subjects[1]
</script>



<style lang="less">
   #examples_SubjectName {
   }
</style>