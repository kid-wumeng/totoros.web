<template lang="jade">
   .Button(@click="click") {{ text }}
</template>



<script lang="coffee">
   module.exports =

      props:
         'text':
            type: String
            required: true

      methods:
         click: =>
            @$emit('click')
</script>



<style lang="less">
   @import '~assets/@';

   @media @small{
   }

   @media @large{
   }
</style>