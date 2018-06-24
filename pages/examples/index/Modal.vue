<template lang="jade">
   #examples_Modal
      Button(text="Modal" @click="open = true")
      Modal(:open="open"  @close="open = false"): Area
</template>



<script lang="coffee">
   module.exports =
      components:
         'Modal':  require('~/components/Modal').default
         'Area':   require('~/components/Area').default
         'Button': require('~/components/Button').default

      data: ->
         open: false
</script>