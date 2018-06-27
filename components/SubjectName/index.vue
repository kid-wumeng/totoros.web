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
            type: String
            default: 'medium'
            validator: (size) => ['small', 'medium', 'large'].includes(size)

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
      text-align: justify;
      color: #273340;
      word-break: break-all;
      cursor: pointer;

      &:hover {
         color: #14BEB4;
      }
   }

   .SubjectName[size="small"] {
      font-size: 13px;
   }

   .SubjectName[size="medium"] {
      font-weight: 600;
      font-size: 15px;
   }

   .SubjectName[size="large"] {
      font-size: 16px;
   }
</style>