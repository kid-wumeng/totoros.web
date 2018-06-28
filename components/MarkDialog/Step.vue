<template lang="jade">
   TabBar.Step(:data="step", :tabs="tabs" @change="change")
</template>



<script lang="coffee">
   module.exports =

      components:
         'TabBar': require('~/components/TabBar').default

      model:
         prop:  'step'
         event: 'change'

      props:
         'step':
            type: Number
            required: true
            validator: (step) => [1, 2, 3].includes(step)

      computed:
         tabs: -> [
            { text: io.formatMarkStep(1), data: 1 }
            { text: io.formatMarkStep(2), data: 2 }
            { text: io.formatMarkStep(3), data: 3 }
         ]

      methods:
         change: (data) -> @$emit('change', data)
</script>