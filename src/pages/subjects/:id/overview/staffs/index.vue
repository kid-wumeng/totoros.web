<template lang="jade">
  detail-box.staffs(v-if="staffs.length" title="STAFF")
    item(v-for="staff in staffs", :key="staff.id", :staff="staff")
</template>


<script lang="coffee">
  module.exports =
    components:
      'detail-box': require('components/wiki/detail-box')
      'item':       require('./item')

    props:
      'subject':
        type: Object
        required: true

    computed:
      staffs: -> @subject.staffs ? []
</script>


<style lang="less" scoped>
  .staffs{
  }
</style>