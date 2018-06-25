<template lang="jade">
   .SubjectList
      SubjectItem(v-for="subject in subjects", :key="subject.id", :subject="subject")
</template>



<script lang="coffee">
   module.exports =
      components:
         'SubjectItem': require('~/components/SubjectItem').default

      props:
         'subjects':
            type: Array
            default: -> []
</script>



<style lang="less">
   .SubjectItem {
   }
</style>