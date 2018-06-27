<template lang="jade">
   .MarkList(:mode="mode")
      MarkItem(v-for="mark in marks", :key="mark.id", :mark="mark", :mode="mode" @update="update(mark)" @remove="remove(mark)")
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

      methods:
         update: ( mark ) -> @$emit('update', mark.id)
         remove: ( mark ) -> @$emit('remove', mark.id)
</script>



<style lang="less">
   .MarkList {
      .MarkItem {
         padding: 20px;
         margin-bottom: 20px;
      }
      .MarkItem:last-child {
         margin-bottom: 0;
      }
   }
</style>