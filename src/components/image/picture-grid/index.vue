<template lang="jade">
  .picture-grid
    component(:pictures="pictures", :is="component")
</template>


<script lang="coffee">
  module.exports =
    components:
      by1:   -> System.import('./by1')
      by2_4: -> System.import('./by2_4')
      by5_9: -> System.import('./by5_9')

    props:
      'pictures':
        type: Array
        default: -> []

    computed:
      component: ->
        len = @pictures.length
        switch
          when len is 1 then 'by1'
          when len <= 4 then 'by2_4'
          else               'by5_9'
</script>