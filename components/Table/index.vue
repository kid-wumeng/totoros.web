<template lang="jade">
   table.Table(:class="tableClass")
      tbody
         slot
</template>



<script lang="coffee">
   module.exports =
      props:
         'auto':
            type: Boolean
            default: false

      computed:
         tableClass: ->
            '-auto': @auto
</script>



<style lang="less">
   .Table {
      width: 100%;
      table-layout: fixed;
      border-collapse: collapse;

      tr {
         border-bottom: 1px solid #F6F6F6;
         th, td {
            height: 40px;
            padding: 8px 20px;
            text-align: left;
            font-size: 14px;
         }
         th { color: #445669 }
         td { color: #646F79 }
      }
   }

   .Table.-auto {
      table-layout: auto;
   }
</style>