<template lang="jade">
   #examples_SubjectList
      SubjectList(:subjects="subjects")
</template>



<script lang="coffee">
   mocks = require('../mocks')

   module.exports =
      components:
         'SubjectList': require('~/components/SubjectList').default

      data: ->
         subjects: mocks.subjects
</script>



<style lang="less">
   #examples_SubjectList {
      width: 800px;
   }
</style>