<template lang="jade">
   Row.MarkItem(mode="user")
      UserFace(:user="user")
      Column
         Row(y="center")
            UserName(:user="user" clickable)
            Step(:mark="mark")
         Score(:mark="mark")
         Content(:mark="mark")
</template>



<script lang="coffee">
   module.exports =

      components:
         'Row':      require('~/components/Row').default
         'Column':   require('~/components/Column').default
         'UserFace': require('~/components/UserFace').default
         'UserName': require('~/components/UserName').default
         'Step':     require('./Step').default
         'Score':    require('./Score').default
         'Content':  require('./Content').default

      props:
         'mark':
            type: Object
            required: true

      computed:
         user: -> @mark.user
         date: -> @mark.createDate
</script>



<style lang="less">
   .MarkItem[mode="user"] {
      .UserFace {
         width: 56px;
      }
      .Column{
         flex: auto;
         margin-left: 16px;
         .Row {
            .Step {
               margin-left: 10px;
            }
         }
         .Score {
            margin-top: 12px;
         }
         .Content {
            margin-top: 10px;
         }
      }
   }
</style>