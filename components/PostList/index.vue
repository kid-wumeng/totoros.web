<template lang="jade">
   .PostList
      PostItem(v-for="post in posts", :key="post.id", :post="post")
</template>



<script lang="coffee">
   module.exports =
      components:
         'PostItem': require('~/components/PostItem').default

      props:
         'posts':
            type: Array
            default: -> []
</script>



<style lang="less">
   .PostList {
      .PostItem {
         margin-bottom: 30px;
         &:last-child {
            margin-bottom: 0 !important;
         }
      }
   }
</style>