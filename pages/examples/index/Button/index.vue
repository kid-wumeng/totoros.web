<template lang="jade">
   #examples_Button
      Button(text="爱情灵药")
</template>



<script lang="coffee">
   module.exports =
      components:
         'Button': require('~/components/Button').default
</script>