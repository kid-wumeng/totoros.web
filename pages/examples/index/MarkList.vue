<template lang="jade">
   #examples_MarkList
      MarkList(:marks="marks" mode="user")
      MarkList(:marks="marks" mode="subject")
</template>



<script lang="coffee">
   mocks = require('../mocks')

   module.exports =
      components:
         'MarkList': require('~/components/MarkList').default

      data: ->
         marks: mocks.marks
</script>



<style lang="less">
   #examples_MarkList {
      .MarkList[mode="user"] {
         width: 750px;
      }
      .MarkList:last-child {
         margin-top: 100px;
      }
   }
</style>