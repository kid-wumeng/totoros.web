<template lang="jade">
   .SubjectName(:size="size" @click="click") {{ name }}
</template>



<script lang="coffee">
   module.exports =

      props:
         'subject':
            type: Object
            required: true

         'size':
            type: Object
            default: 'medium'
            validator: (type) => ['small', 'medium', 'large'].includes(type)

      computed:
         name: ->
            { name, nameOrigin, nameAliases } = @subject

            if name
               return name

            if nameOrigin
               return nameOrigin

            if Array.isArray(nameAliases) and nameAliases.length
               for alias in nameAliases
                   if alias
                      return alias

            return '?????'

      methods:
         click: ->
            @$router.push("/subjects/#{@subject.id}")
</script>



<style lang="less">
   .SubjectName {
      font-weight: 600;
      cursor: pointer;
      color: #273340;

      &:hover {
         color: #14BEB4;
      }
   }

   .SubjectName[size="small"] {
      font-size: 16px;
   }

   .SubjectName[size="medium"] {
      font-size: 15px;
   }

   .SubjectName[size="large"] {
      font-size: 16px;
   }
</style>