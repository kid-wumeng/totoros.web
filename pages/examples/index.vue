<template lang="jade">
   #examples
      Area.side
         nuxt-link(to="/examples/Button") Button
      Area.main
         nuxt-child
</template>



<script lang="coffee">
   module.exports =
      components:
         'Area': require('~/components/Area').default
</script>



<style lang="less">
   @import '~assets/@';
   @padding: 25px;

   #examples {
      position: fixed;
      width: 100%;
      height: 100%;
      padding: @padding * 2;
      display: flex;

      .Area.side {
         width: 20%;
         padding: @padding;
      }

      .Area.main {
         flex: auto;
         margin-left: @padding;
         padding: @padding;
      }
   }
</style>