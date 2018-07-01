<template lang="jade">
   Row.PostItem(y="center")
      CommentCount(:post="post")
      UserFace(:user="user")
      Column(x="left")
         PostName(:post="post" clickable)
         PostDesc(:post="post")
</template>



<script lang="coffee">
   module.exports =

      components:
         'Row':          require('~/components/Row').default
         'Column':       require('~/components/Column').default
         'UserFace':     require('~/components/UserFace').default
         'UserName':     require('~/components/UserName').default
         'PostName':     require('~/components/PostName').default
         'PostDesc':     require('./Desc').default
         'CommentCount': require('./CommentCount').default

      props:
         'post':
            type: Object
            required: true

      computed:
         user: -> @post.user
</script>


<style lang="less">
   .PostItem {
      .UserFace {
         margin-left: 12px;
         width: 48px;
      }

      > .Column {
         flex: auto;
         margin-left: 16px;

         .PostName {
            text-shadow: 1px 1px 1px rgba(0, 0, 0, 0.2);
         }

         .Desc {
            margin-top: 6px;
         }
      }
   }
</style>