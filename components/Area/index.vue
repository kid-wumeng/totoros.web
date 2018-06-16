<template lang="jade">
   .Area
      slot
</template>



<script lang="coffee">
   module.exports =

      props:
         'name':
            type: String
            default: ''
</script>



<style lang="less">
   @import '~assets/@';

   .Area {
      background-color: white;
      border-radius: 2px;
      box-shadow: 1px 1px 3px rgba(0, 0, 0, 0.5);
   }
</style>