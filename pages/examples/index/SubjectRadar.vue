<template lang="jade">
   #examples_SubjectRadar
      SubjectRadar(:subject="subject1")
      SubjectRadar(:subject="subject2")
</template>



<script lang="coffee">

   mocks = require('../mocks')

   module.exports =
      components:
         'SubjectRadar': require('~/components/SubjectRadar').default

      data: ->
         subject1: mocks.subjects[0]
         subject2: mocks.subjects[1]
</script>



<style lang="less">
   #examples_SubjectRadar {
      justify-content: center;
      align-items: center;

      .SubjectRadar {
         width: 200px;
         &:last-child {
            margin-top: 50px;
         }
      }
   }
</style>