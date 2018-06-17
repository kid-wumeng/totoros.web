<template lang="jade">
   RadioGrid.RadioBar(:radios="radios", :data="data", :many="many", :type="type", :auto="auto", @change="change")
</template>



<script lang="coffee">

   ########################################
   #|
   #|   radio - {string} text
   #|           {*}      data
   #|           {string} [to]
   #|
   ########################################

   module.exports =

      components:
         'RadioGrid': require('~/components/RadioGrid').default

      model:
         prop:  'data'
         event: 'change'

      props: ['radios', 'data', 'many', 'type', 'auto']

      methods:
         change: (data) ->
            @$emit('change', data)
</script>