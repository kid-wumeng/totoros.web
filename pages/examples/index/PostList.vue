<template lang="jade">
   #examples_PostList
      PostList(:posts="posts")
</template>



<script lang="coffee">

   mocks = require('../mocks')

   module.exports =
      components:
         'PostList': require('~/components/PostList').default

      data: ->
         posts: mocks.posts
</script>



<style lang="less">
   #examples_PostList {
      .PostList {
         width: 640px;
      }
   }
</style>