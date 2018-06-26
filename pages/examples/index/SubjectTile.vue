<template lang="jade">
   #examples_SubjectTile
      SubjectTile(:subject="subject")
</template>



<script lang="coffee">
   mocks = require('../mocks')

   module.exports =
      components:
         'SubjectTile': require('~/components/SubjectTile').default

      data: ->
         subject: mocks.subject
</script>



<style lang="less">
   #examples_SubjectTile {
      .SubjectTile {
         width: 120px;
      }
   }
</style>