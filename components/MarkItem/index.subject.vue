<template lang="jade">
   Row.MarkItem(mode="subject")
      ImageFrame: SubjectFace(:subject="subject")
      Column
         SubjectName(:subject="subject")
         SubjectDesc(:subject="subject")
         Score(:mark="mark")
         Content(:mark="mark")
</template>



<script lang="coffee">
   module.exports =

      components:
         'Row':         require('~/components/Row').default
         'Column':      require('~/components/Column').default
         'ImageFrame':  require('~/components/ImageFrame').default
         'SubjectFace': require('~/components/SubjectFace').default
         'SubjectName': require('~/components/SubjectName').default
         'SubjectDesc': require('~/components/SubjectDesc').default
         'Score':       require('./Score').default
         'Content':     require('./Content').default

      props:
         'mark':
            type: Object
            required: true

      computed:
         subject: -> @mark.subject
</script>



<style lang="less">
   .MarkItem[mode="subject"] {
      .SubjectFace {
         width: 90px;
      }
      .Column{
         flex: auto;
         margin-left: 24px;
         .SubjectDesc {
            margin-top: 10px;
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