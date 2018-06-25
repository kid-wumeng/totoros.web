<template lang="jade">
   Row.SubjectItem
      ImageFrame: SubjectFace(:subject="subject")
      Column
         SubjectName(:subject="subject")
         SubjectDesc(:subject="subject")
         TextArea(:text="subject.intro")
      SubjectRadar(:subject="subject")
</template>



<script lang="coffee">
   module.exports =

      components:
         'Row':          require('~/components/Row').default
         'Column':       require('~/components/Column').default
         'TextArea':     require('~/components/TextArea').default
         'ImageFrame':   require('~/components/ImageFrame').default
         'SubjectFace':  require('~/components/SubjectFace').default
         'SubjectName':  require('~/components/SubjectName').default
         'SubjectDesc':  require('~/components/SubjectDesc').default
         'SubjectRadar': require('~/components/SubjectRadar').default

      props:
         'subject':
            type: Object
            required: true
</script>



<style lang="less">
   .SubjectItem {
      width: 800px;

      .SubjectFace {
         width: 80px;
      }

      .Column{
         flex: auto;
         margin: 0 20px;
         .TextArea {
            text-indent: 2em;
         }
      }

      .SubjectRadar {
         width: 150px;
      }
   }
</style>