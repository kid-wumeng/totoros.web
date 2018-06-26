<template lang="jade">
   #examples_Grid
      Grid
         .tile(v-for="i in 10", :key="i")
            .i {{ i }}
</template>



<script lang="coffee">
   mocks = require('../mocks')

   module.exports =
      components:
         'Grid': require('~/components/Grid').default

      data: ->
         subjects: mocks.subjects
</script>



<style lang="less">
   #examples_Grid {
      background-color: black;

      .tile {
         .i {
            height: 100px;
            font-weight: 600;
            font-size: 20px;
            background-color: #EEE;
            display: flex;
            justify-content: center;
            align-items: center;
         }
      }
   }
</style>