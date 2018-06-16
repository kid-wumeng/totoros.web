<template lang="jade">
   #demo
</template>



<script lang="coffee">
   module.exports =
      data: =>
         abc: true
</script>



<style lang="less">

   @import '~assets/@';

   @media @small{
      h1{
         background-color: @kid;
      }
   }

   @media @large{
      h1{
         background-color: @kid;
      }
   }
</style>