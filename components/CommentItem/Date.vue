<template lang="jade">
   .Date
      span {{ date }}
      span.sep /
      span {{ floor }}楼
</template>



<script lang="coffee">
   module.exports =
      props:
         'comment':
            type: Object
            required: true

      computed:
         date:  -> io.formatDate(@comment.createDate)
         floor: -> @comment.floor
</script>



<style lang="less">
   .CommentItem {
      .Date {
         font-family: "Ubuntu";
         font-size: 12px;
         color: #A2AEBA;
         user-select: none;

         .sep {
            margin: 0 6px;
            font-family: "Lato";
         }
      }
   }
</style>