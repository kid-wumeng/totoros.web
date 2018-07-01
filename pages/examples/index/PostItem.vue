<template lang="jade">
   #examples_PostItem
      PostItem(:post="post")
</template>



<script lang="coffee">

   mocks = require('../mocks')

   module.exports =
      components:
         'PostItem': require('~/components/PostItem').default

      data: ->
         post: mocks.post
</script>