<template lang="jade">
   Dialog.Loading(:open="open")
      .wrap
         Indicator(v-if="value === null")
         ProgressBar(v-else :value="value", :total="total")
         .text {{ text }}
</template>



<script lang="coffee">
   module.exports =

      components:
         'Dialog':      require('~/components/Dialog').default
         'ProgressBar': require('./ProgressBar').default
         'Indicator':   require('./Indicator').default

      props:
         'open':
            type: Boolean
            default: false
         'text':
            type: String
            default: 'loading ...'
         'value':
            type: Number
            default: null
         'total':
            type: Number
            default: 100
</script>



<style lang="less">
   .Loading {
      .text {
         margin-top: 16px;
         text-align: center;
         font-weight: 500;
         font-size: 14px;
         color: white;
      }
   }
</style>