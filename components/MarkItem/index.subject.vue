<template lang="jade">
   Row.MarkItem(mode="subject")
      ImageFrame: SubjectFace(:subject="subject")
      Column(x="fill")
         Row(x="between" y="center")
            SubjectName(:subject="subject" clickable)
            Step(:mark="mark")
         SubjectDesc(:subject="subject")
         Score(:mark="mark")
         Content(:mark="mark")
      Read(:subject="subject")
</template>



<script lang="coffee">
   module.exports =

      components:
         'Row':         require('~/components/Row').default
         'Column':      require('~/components/Column').default
         'ImageFrame':  require('~/components/ImageFrame').default
         'Read':        require('~/components/Read').default
         'SubjectFace': require('~/components/SubjectFace').default
         'SubjectName': require('~/components/SubjectName').default
         'SubjectDesc': require('~/components/SubjectDesc').default
         'Step':        require('./Step').default
         'Score':       require('./Score').default
         'Content':     require('./Content').default

      props:
         'mark':
            type: Object
            required: true

      computed:
         subject: -> @mark.subject

      methods:
         update: -> @$emit('update')
         remove: -> @$emit('remove')
</script>



<style lang="less">
   .MarkItem[mode="subject"] {
      .SubjectFace {
         width: 80px;
      }
      .Column{
         flex: auto;
         margin-left: 24px;
         margin-right: 64px;
         .Row {
            .Step {
               margin-left: 16px;
            }
         }
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