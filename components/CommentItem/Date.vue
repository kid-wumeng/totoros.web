<template lang="jade">
   .Date {{ date }} / {{ floor }}楼
</template>



<script lang="coffee">
   module.exports =
      props:
         'comment':
            type: Object
            required: true

      computed:
         date:  -> io.formatDate(@comment.createDate, time = true)
         floor: -> @comment.floor
</script>



<style lang="less">
   .CommentItem {
      .Date {
         font-size: 12px;
         color: #707C88;
      }
   }
</style>