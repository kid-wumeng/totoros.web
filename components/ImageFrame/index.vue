<template lang="jade">
   .ImageFrame(:class="frameClass")
      slot
</template>



<script lang="coffee">
   module.exports =

      data: ->
         display: false

      computed:
         frameClass: ->
            '-display': @display

      mounted: ->
         @display = true
</script>



<style lang="less">
   .ImageFrame {
      flex: none;
      padding: 2px;
      border: 1px solid transparent;
   }

   .ImageFrame.-display {
      background-color: white;
      border: 1px solid #C7C7C9;
      box-shadow: 0 0px 3px rgba(0, 0, 0, 0.12);
   }
</style>