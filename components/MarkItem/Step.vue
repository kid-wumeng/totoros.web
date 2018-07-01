<template lang="jade">
   .Step
      span {{ date }}
      span.sep /
      span {{ step }}
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
      font-family: "Ubuntu";
      font-size: 12px;
      color: #A2AEBA;
      user-select: none;

      .sep {
         margin: 0 6px;
         font-family: "Lato";
      }
   }
</style>