<template lang="jade">
   #examples_PageBar
      PageBar(:count="200", :size="6")
</template>



<script lang="coffee">
   module.exports =
      components:
         'PageBar': require('~/components/PageBar').default
</script>