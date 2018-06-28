<template lang="jade">
   .Step ( {{ date }} / {{ step }} )
</template>



<script lang="coffee">
   module.exports =
      props:
         'mark':
            type: Object
            required: true

      computed:
         date: -> io.formatDate(@mark.createDate)
         step: -> io.formatMarkStep(@mark.step)
</script>



<style lang="less">
   .Step {
      font-size: 12px;
      color: #707C88;
   }
</style>