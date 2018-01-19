<template lang="jade">
  detail-area.staffs(v-if="staffs.length" title="STAFF")
    item(v-for="staff in staffs", :key="staff.id", :staff="staff")
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
      staffs: -> @person.staffs ? []
</script>