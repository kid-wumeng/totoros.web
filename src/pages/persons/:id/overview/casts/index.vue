<template lang="jade">
  detail-area.casts(v-if="casts.length" title="CAST")
    item(v-for="cast in casts", :key="cast.id", :cast="cast")
</template>


<script lang="coffee">
  module.exports =
    components:
      'detail-area':  require('components/wiki/detail-area')
      'item':         require('./item')

    props:
      'person':
        type: Object
        required: true

    computed:
      casts: -> @person.casts ? []
</script>