<template lang="jade">
   Column.SubjectTile(x="center")
      SubjectFace(:subject="subject")
      SubjectName(:subject="subject" size="small")
</template>



<script lang="coffee">
   module.exports =

      components:
         'Column':      require('~/components/Column').default
         'ImageFrame':  require('~/components/ImageFrame').default
         'SubjectFace': require('~/components/SubjectFace').default
         'SubjectName': require('~/components/SubjectName').default

      props:
         'subject':
            type: Object
            required: true
</script>



<style lang="less">
   .SubjectTile {
      .ImageFrame {
         width: 100%;
      }
      .SubjectFace {
         width: 100%;
      }
      .SubjectName {
         margin-top: 10px;
      }
   }
</style>