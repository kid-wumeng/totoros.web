<template lang="jade">
   Input.Like(:text="like" hint="Anime / Comic / Author" @input="input")
</template>



<script lang="coffee">
   module.exports =

      components:
         'Input': require('~/components/Input').default

      model:
         prop:  'like'
         event: 'change'

      props:
         'like':
            type: String
            required: true

      mounted: ->
         @$el.focus()

      methods:
         input: (text) -> @$emit('change', text)
</script>



<style lang="less">
   .Like {
      width: 100%;
   }
</style>