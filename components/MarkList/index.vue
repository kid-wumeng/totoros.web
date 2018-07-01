<template lang="jade">
   .MarkList(:mode="mode")
      MarkItem(v-for="mark in marks", :key="mark.id", :mark="mark", :mode="mode")
</template>



<script lang="coffee">
   module.exports =
      components:
         'MarkItem': require('~/components/MarkItem').default

      props:
         'marks':
            type: Array
            default: -> []

         'mode':
            type: String
            required: true
            validator: (mode) => ['user', 'subject'].includes(mode)
</script>



<style lang="less">
   .MarkList {
      .MarkItem {
         margin-bottom: 60px;
         &:last-child {
            margin-bottom: 0 !important;
         }
      }
   }
</style>