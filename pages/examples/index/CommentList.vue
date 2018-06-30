<template lang="jade">
   #examples_CommentList
      CommentList(:comments="comments")
</template>



<script lang="coffee">

   mocks = require('../mocks')

   module.exports =
      components:
         'CommentList': require('~/components/CommentList').default

      data: ->
         comments: mocks.comments
</script>



<style lang="less">
   #examples_CommentList {
      .CommentList {
         width: 750px;
      }
   }
</style>