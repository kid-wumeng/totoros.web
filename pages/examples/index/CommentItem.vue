<template lang="jade">
   #examples_CommentItem
      CommentItem(:comment="comment")
</template>



<script lang="coffee">

   mocks = require('../mocks')

   module.exports =
      components:
         'CommentItem': require('~/components/CommentItem').default

      data: ->
         comment: mocks.comment
</script>