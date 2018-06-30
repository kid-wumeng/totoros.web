<template lang="jade">
   .CommentList(:mode="mode")
      CommentItem(v-for="comment in comments", :key="comment.id", :comment="comment")
</template>



<script lang="coffee">
   module.exports =
      components:
         'CommentItem': require('~/components/CommentItem').default

      props:
         'comments':
            type: Array
            default: -> []
</script>



<style lang="less">
   .CommentList {
      .CommentItem {
         margin-bottom: 60px;
         &:last-child {
            margin-bottom: 0;
         }
      }
   }
</style>