<template lang="jade">
   .SubjectItem
      Row
         ImageFrame: SubjectFace(:subject="subject")
</template>



<script lang="coffee">
   module.exports =

      components:
         'Row':         require('~/components/Row').default
         'ImageFrame':  require('~/components/ImageFrame').default
         'SubjectFace': require('~/components/SubjectFace').default

      props:
         'subject':
            type: Object
            required: true
</script>



<style lang="less">
   .SubjectItem {
      > .Row {
         > .ImageFrame {
            > .SubjectFace {
               width: 80px;
            }
         }
      }
   }
</style>