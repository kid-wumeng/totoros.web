<template lang="jade">
   RadioBar.Types(:radios="radios", :data="types" many @change="change")
</template>



<script lang="coffee">
   module.exports =

      components:
         'RadioBar': require('~/components/RadioBar').default

      model:
         prop:  'types'
         event: 'change'

      props:
         'types':
            type: Array
            required: true

      computed:
         radios: ->
            return io.allSubjectTypes().map (type) =>
               return
                  text: io.formatSubjectType(type)
                  data: type

      methods:
         change: (data) -> @$emit('change', data)
</script>