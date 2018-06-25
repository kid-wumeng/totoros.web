<template lang="jade">
   .SubjectDesc {{ desc }}
</template>



<script lang="coffee">
   module.exports =

      props:
         'subject':
            type: Object
            required: true

      computed:
         start:   -> @subject.start   ? {}
         type:    -> @subject.type    ? ''
         way:     -> @subject.way     ? ''
         authors: -> @subject.authors ? []
         styles:  -> @subject.styles  ? []

         desc: ->
            descs = []

            if @start.year
               descs.push(@start.year)

            if @type
               if @type is 'anime' and @way
                  descs.push(io.formatSubjectWay(@way))
               else
                  descs.push(io.formatSubjectType(@type))

            if @authors?.length
               descs.push(@authors.join('、'))

            if @styles?.length
               descs.push(@styles.join('、'))

            return descs.join(' / ')
</script>



<style lang="less">
   .SubjectDesc {
   }
</style>