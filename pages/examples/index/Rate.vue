<template lang="jade">
   #examples_Rate
      Rate(v-model="score" size="small")
      Rate(v-model="score" size="large" changeable)
</template>



<script lang="coffee">
   module.exports =
      components:
         'Rate': require('~/components/Rate').default

      data: ->
         score: 5
</script>



<style lang="less">
   #examples_Rate {
   }
</style>