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
      text-indent: 2em;
   }
</style>