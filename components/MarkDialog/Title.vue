<template lang="jade">
   .Title Mark〖 {{ subject.name }} 〗
</template>



<script lang="coffee">
   module.exports =

      props:
         'subject':
            type: Object
            required: true

      computed:
         name: -> @subject.name
         type: -> @subject.type
         way:  -> @subject.way

         typeOrWay: -> @io.formatSubjectTypeOrWay(@type, @way)
</script>



<style lang="less">
   .Title {
      text-align: center;
      font-family: "Ubuntu";
      font-weight: 500;
      font-size: 16px;
      color: #445669;
   }
</style>