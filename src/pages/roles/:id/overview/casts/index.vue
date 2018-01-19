<template lang="jade">
  detail-box.casts(v-if="casts.length" title="CAST")
    item(v-for="cast in casts", :key="cast.id", :cast="cast")
</template>


<script lang="coffee">
  module.exports =
    components:
      'detail-box': require('components/wiki/detail-box')
      'item':       require('./item')

    props:
      'role':
        type: Object
        required: true

    computed:
      casts: -> @role.casts ? []
</script>