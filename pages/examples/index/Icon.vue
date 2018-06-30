<template lang="jade">
   #examples_Icon
      Row(y="center")
         .name bell
         Icon(name="bell")
</template>



<script lang="coffee">
   module.exports =
      components:
         'Row':  require('~/components/Row').default
         'Icon': require('~/components/Icon').default
</script>



<style lang="less">
   #examples_Icon {
      .Row {
         .name {
            width: 60px;
            font-size: 20px;
         }
         .Icon {
            font-size: 28px;
         }
      }
   }
</style>