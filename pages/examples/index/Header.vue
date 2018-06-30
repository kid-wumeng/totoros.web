<template lang="jade">
   #examples_Header
      Header(:user="user", :remind-count="6")
</template>



<script lang="coffee">

   mocks = require('../mocks')

   module.exports =

      components:
         'Header': require('~/components/Header').default

      data: ->
         'user': mocks.user
</script>



<style lang="less">
   #examples_Header {
      background-color: black;
   }
</style>