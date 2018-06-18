<template lang="jade">
   #examples_ImageCDN
      ImageCDN(alt="硬核漫画 totoros.cc" path="images/f78d2f0e0a44fe0a778b61d06ca488b7")
      ImageCDN(alt="硬核漫画 totoros.cc")
</template>



<script lang="coffee">
   module.exports =
      components:
         'ImageCDN': require('~/components/ImageCDN').default
</script>



<style lang="less">
   #examples_ImageCDN {
      .ImageCDN {
         width: 200px;
         height: 200px;
      }
   }
</style>