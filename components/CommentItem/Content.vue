<template lang="jade">
   TextArea.Content(:text="comment.content")
</template>



<script lang="coffee">
   module.exports =
      components:
         'TextArea': require('~/components/TextArea').default

      props:
         'comment':
            type: Object
            required: true
</script>



<style lang="less">
   .CommentItem {
      .Content {
         text-indent: 2em;
         color: #445669 !important;
      }
   }
</style>