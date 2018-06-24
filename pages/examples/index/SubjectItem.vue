<template lang="jade">
   #examples_SubjectItem
      SubjectItem(:subject="subject")
</template>



<script lang="coffee">

   mocks = require('../mocks')

   module.exports =
      components:
         'SubjectItem': require('~/components/SubjectItem').default

      data: ->
         subject: mocks.subject
</script>



<style lang="less">
   #examples_SubjectItem {
      .SubjectItem {
      }
   }
</style>