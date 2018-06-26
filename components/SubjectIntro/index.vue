<template lang="jade">
   TextArea.SubjectIntro(:text="subject.intro")
</template>



<script lang="coffee">
   module.exports =
      components:
         'TextArea': require('~/components/TextArea').default

      props:
         'subject':
            type: Object
            required: true
</script>



<style lang="less">
   .SubjectIntro.TextArea {
      line-height: 22px;
      text-indent: 2em;
      text-align: justify;
      font-size: 14px;

      p {
         margin-bottom: 6px;
      }
   }
</style>