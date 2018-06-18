<template lang="jade">
   #examples_ImageFrame
      ImageFrame: ImageCDN(alt="硬核漫画 totoros.cc" path="images/f78d2f0e0a44fe0a778b61d06ca488b7")
      ImageFrame: ImageCDN(alt="硬核漫画 totoros.cc")
</template>



<script lang="coffee">
   module.exports =
      components:
         'ImageFrame': require('~/components/ImageFrame').default
         'ImageCDN':   require('~/components/ImageCDN').default
</script>



<style lang="less">
   #examples_ImageFrame {
      .ImageCDN {
         width: 200px;
         height: 200px;
      }
   }
</style>