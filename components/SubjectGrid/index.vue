<template lang="jade">
   Grid.SubjectGrid
      SubjectTile(v-for="(subject, index) in subjects", :key="index", :subject="subject")
      SubjectTile(v-for="(subject, index) in subjects", :key="index", :subject="subject")
      SubjectTile(v-for="(subject, index) in subjects", :key="index", :subject="subject")
      SubjectTile(v-for="(subject, index) in subjects", :key="index", :subject="subject")
      SubjectTile(v-for="(subject, index) in subjects", :key="index", :subject="subject")
      SubjectTile(v-for="(subject, index) in subjects", :key="index", :subject="subject")
</template>



<script lang="coffee">
   module.exports =
      components:
         'Grid':        require('~/components/Grid').default
         'SubjectTile': require('~/components/SubjectTile').default

      props:
         'subjects':
            type: Array
            default: -> []
</script>