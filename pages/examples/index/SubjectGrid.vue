<template lang="jade">
   #examples_SubjectGrid
      SubjectGrid(:subjects="subjects")
</template>



<script lang="coffee">
   mocks = require('../mocks')

   module.exports =
      components:
         'SubjectGrid': require('~/components/SubjectGrid').default

      data: ->
         subjects: mocks.subjects
</script>



<style lang="less">
   #examples_SubjectGrid {
   }
</style>