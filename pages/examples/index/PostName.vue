<template lang="jade">
   #examples_PostName
      PostName(:post="post1")
      PostName(:post="post2" clickable)
</template>



<script lang="coffee">

   mocks = require('../mocks')

   module.exports =
      components:
         'PostName': require('~/components/PostName').default

      data: ->
         post1: mocks.posts[0]
         post2: mocks.posts[1]
</script>