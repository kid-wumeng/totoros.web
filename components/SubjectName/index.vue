<template lang="jade">
   .SubjectName(@click="click") {{ name }}
</template>



<script lang="coffee">
   module.exports =

      props:
         'subject':
            type: Object
            required: true

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
      cursor: pointer;
   }
</style>