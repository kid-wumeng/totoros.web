<template lang="jade">
   Row.CommentItem
      UserFace(:user="user")
      Column
         Row(x="between" y="center")
            UserName(:user="user" clickable)
            Date(:comment="comment")
         Content(:comment="comment")
</template>



<script lang="coffee">
   module.exports =

      components:
         'Row':      require('~/components/Row').default
         'Column':   require('~/components/Column').default
         'UserFace': require('~/components/UserFace').default
         'UserName': require('~/components/UserName').default
         'Date':     require('./Date').default
         'Content':  require('./Content').default

      props:
         'comment':
            type: Object
            required: true

      computed:
         user: -> @comment.user
</script>


<style lang="less">
   .CommentItem {
      .UserFace {
         width: 56px;
      }

      .Column{
         flex: auto;
         margin-left: 16px;

         .Row {
            .Date {
               margin-left: 10px;
            }
         }

         .Content {
            margin-top: 10px;
         }
      }
   }
</style>