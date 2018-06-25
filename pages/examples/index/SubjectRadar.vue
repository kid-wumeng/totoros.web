<template lang="jade">
   #examples_SubjectRadar
      SubjectRadar(:subject="subject")
</template>



<script lang="coffee">

   mocks = require('../mocks')

   module.exports =
      components:
         'SubjectRadar': require('~/components/SubjectRadar').default

      data: ->
         subject: mocks.subject
</script>



<style lang="less">
   #examples_SubjectRadar {
      .SubjectRadar {
         width: 200px;
         background-color: #EEE;
      }
   }
</style>