<template lang="jade">
  detail-area.staffs(v-if="staffs.length" title="STAFF")
    .wrap
      item(v-for="staff in staffs", :key="staff.id", :staff="staff")
</template>


<script lang="coffee">
  module.exports =
    components:
      'detail-area': require('components.h5/detail-area')
      'item':        require('./item')

    props:
      'organization':
        type: Object
        required: true

    computed:
      staffs: -> @organization.staffs ? []
</script>


<style lang="less" scoped>
  .staffs{
    .wrap{
      background-color: rgba(249, 249, 249, 1);
      overflow: hidden;
      .item{
        padding: 20px;
        background-color: #FFF;
        margin-bottom: 6px;
        &:last-child{
          margin-bottom: 0;
        }
      }
    }
  }
</style>