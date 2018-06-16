<template lang="jade">
   #examples
      Area.side
         nuxt-link(to="/examples/Area")   Area
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
   @padding: 20px;

   #examples {
      position: fixed;
      width: 100%;
      height: 100%;
      padding: @padding * 3;
      display: flex;

      .Area.side {
         width: 20%;
         padding: @padding;

         > a {
            background-color: red;
         }
      }

      .Area.main {
         flex: auto;
         margin-left: @padding;
         padding: @padding;
         > * {
            display: flex;
            flex-direction: column;
            align-items: flex-start;
            > * {
               flex: none;
               margin-bottom: @padding;
               &:last-child {
                  margin-bottom: 0;
               }
            }
         }
      }
   }
</style>