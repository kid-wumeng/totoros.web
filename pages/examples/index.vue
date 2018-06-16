<template lang="jade">
   #examples
      Area.side
         nuxt-link(to="/examples/Area",   :class="getClass('Area')")   Area
         nuxt-link(to="/examples/Button", :class="getClass('Button')") Button
      Area.main
         nuxt-child
</template>



<script lang="coffee">
   module.exports =
      components:
         'Area': require('~/components/Area').default

      methods:
         getClass: (component) ->

            isCurrentComponent = @$route.path is "/examples/#{component}"

            if isCurrentComponent
               return {'-active': true}
            else
               return {}
</script>



<style lang="less">

   @padding: 16px;

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
            display: block;
            padding: @padding;
            border-radius: 2px;
            &:hover,
            &.-active {
               background-color: #F6F6F6;
            }
         }
      }

      .Area.main {
         flex: auto;
         margin-left: @padding;
         padding: @padding;
         overflow: scroll;
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