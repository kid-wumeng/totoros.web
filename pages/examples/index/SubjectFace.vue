<template lang="jade">
   #examples_SubjectFace
      SubjectFace(:subject="subject")
      SubjectFace(:subject="null")
      SubjectFace(:subject="subject" auto)
      SubjectFace(:subject="null" auto)
</template>



<script lang="coffee">

   mocks = require('../mocks')

   module.exports =
      components:
         'SubjectFace': require('~/components/SubjectFace').default

      data: ->
         subject: mocks.subject
</script>



<style lang="less">
   #examples_SubjectFace {
      .SubjectFace {
         width: 120px;
      }
   }
</style>