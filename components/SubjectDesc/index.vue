<template lang="jade">
   .SubjectDesc(v-html="desc")
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
               descs.push(io.formatSubjectTypeOrWay(@type, @way))

            if @authors?.length
               descs.push(@authors.join('、'))

            if @styles?.length
               descs.push(@styles.join('、'))

            return descs.join('<span class="sep">/</span>')
</script>



<style lang="less">
   .SubjectDesc {
      font-size: 13px;
      color: #A2AEBA;
      .sep {
         margin: 0 8px;
      }
   }
</style>