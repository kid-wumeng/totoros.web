<template lang="jade">
   Row.SubjectItem
      ImageFrame: SubjectFace(:subject="subject")
      Column
         SubjectName(:subject="subject")
         SubjectDesc(:subject="subject")
         SubjectIntro(:subject="subject")
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
         'SubjectIntro': require('~/components/SubjectIntro').default
         'SubjectRadar': require('~/components/SubjectRadar').default

      props:
         'subject':
            type: Object
            required: true
</script>



<style lang="less">
   .SubjectItem {
      .SubjectFace {
         width: 90px;
      }
      .Column{
         flex: auto;
         margin-left: 24px;
         margin-right: 56px;

         .SubjectDesc {
            margin-top: 10px;
         }
         .SubjectIntro {
            margin-top: 10px;
         }
      }
      .SubjectRadar {
         width: 140px;
      }
   }
</style>