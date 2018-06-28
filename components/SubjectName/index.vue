<template lang="jade">
   nuxt-link.SubjectName(v-if="clickable", :size="size", :to="to") {{ subject.name }}
   span.SubjectName(v-else :size="size") {{ subject.name }}
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

         'clickable':
            type: Boolean
            default: false


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

         to: ->
            return "/subjects/#{@subject.id}"
</script>



<style lang="less">
   .SubjectName {
      display: block;
      text-align: justify;
      word-break: break-all;
      font-family: "Ubuntu";
      color: #273340;
   }

   .SubjectName[size="small"] {
      font-size: 13px;
   }

   .SubjectName[size="medium"] {
      font-weight: 500;
      font-size: 15px;
   }

   .SubjectName[size="large"] {
      font-size: 16px;
   }

   a.SubjectName {
      &:hover {
         text-decoration: underline;
      }
   }
</style>