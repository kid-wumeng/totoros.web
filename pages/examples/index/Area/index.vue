<template lang="jade">
   #examples_Area
      Area.a1(name="MARKS")
         Button(text="想看")
         Button(text="在看")
         Button(text="看过")
      Area.a2(name="标记")
         Button(text="想看")
         Button(text="在看")
         Button(text="看过")
</template>



<script lang="coffee">
   module.exports =
      components:
         'Area':   require('~/components/Area').default
         'Button': require('~/components/Button').default
</script>



<style lang="less">
   #examples_Area {
      .Button {
         margin: 12px;
         width: 200px;
      }

      .Area.a2{
         .Button{
            float: left;
         }
      }
   }
</style>