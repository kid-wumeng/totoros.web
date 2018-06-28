<template lang="jade">
   #examples_MarkItem
      MarkItem(:mark="mark" mode="user")
      MarkItem(:mark="mark" mode="subject")
</template>



<script lang="coffee">
   mocks = require('../mocks')

   module.exports =
      components:
         'MarkItem': require('~/components/MarkItem').default

      data: ->
         mark: mocks.mark
</script>



<style lang="less">
   #examples_MarkItem {
      .MarkItem:last-child {
         margin-top: 100px;
      }
   }
</style>