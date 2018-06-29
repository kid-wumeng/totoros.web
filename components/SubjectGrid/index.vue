<template lang="jade">
   Grid.SubjectGrid
      SubjectTile(v-for="subject in subjects", :key="subject.id", :subject="subject")
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