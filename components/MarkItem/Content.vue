<template lang="jade">
   TextArea.Content(:text="mark.content")
</template>



<script lang="coffee">
   module.exports =
      components:
         'TextArea': require('~/components/TextArea').default

      props:
         'mark':
            type: Object
            required: true
</script>



<style lang="less">
   .MarkItem {
      .Content {
         text-indent: 2em;
         color: #445669 !important;
      }
   }
</style>