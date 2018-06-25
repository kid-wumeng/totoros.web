<template lang="jade">
   #examples_SubjectIntro
      SubjectIntro(:subject="subject1")
      SubjectIntro(:subject="subject2")
</template>



<script lang="coffee">

   mocks = require('../mocks')

   module.exports =
      components:
         'SubjectIntro': require('~/components/SubjectIntro').default

      data: ->
         subject1: mocks.subjects[0]
         subject2: mocks.subjects[1]
</script>



<style lang="less">
   #examples_SubjectIntro {
   }
</style>