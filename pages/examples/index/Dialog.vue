<template lang="jade">
   #examples_Dialog
      Dialog(:open="open"  @close="open = false"): Area
      Button(text="dialog" @click="open = true")
</template>



<script lang="coffee">
   module.exports =
      components:
         'Dialog': require('~/components/Dialog').default
         'Area':   require('~/components/Area').default
         'Button': require('~/components/Button').default

      data: ->
         open: false
</script>



<style lang="less">
   #examples_Dialog {
      height: 100%;
      display: flex;
      justify-content: center;
      align-items: center;

      .Dialog {
         .Area {
            width: 300px;
            height: 160px;
         }
      }

      .Button {
         margin: 0 auto;
      }
   }
</style>