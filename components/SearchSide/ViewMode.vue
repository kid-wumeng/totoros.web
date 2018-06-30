<template lang="jade">
   RadioBar.ViewMode(:radios="radios", :data="view" @change="change")
</template>



<script lang="coffee">
   module.exports =

      components:
         'RadioBar': require('~/components/RadioBar').default

      model:
         prop:  'view'
         event: 'change'

      props:
         'view':
            type: String
            required: true

      data: ->
         'radios': [
            { text: '列表 View', data: 'list' }
            { text: '网格 View', data: 'grid' }
         ]

      methods:
         change: (data) -> @$emit('change', data)
</script>



<style lang="less">
   .ViewMode.RadioBar {
      font-family: "Ubuntu";
   }
</style>