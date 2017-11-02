<template lang="jade">
  detail-area.staffs(v-if="staffs.length" title="STAFF")
    grid
      .staff(v-for="staff in staffs", :key="staff.id")
        person-face(v-if="staff.type === 'person'", :person="staff.person" square)
        organization-face(v-if="staff.type === 'organization'", :organization="staff.organization" square)
        person-name(v-if="staff.type === 'person'", :person="staff.person")
        organization-name(v-if="staff.type === 'organization'", :organization="staff.organization")
        .jobs {{ displayJobs(staff) }}
</template>


<script lang="coffee">
  module.exports =
    components:
      'detail-area':       require('components/wiki/detail-area')
      'grid':              require('components/@/grid')
      'person-face':       require('components/image/person-face')
      'person-name':       require('components/wiki/person-name')
      'organization-face': require('components/image/organization-face')
      'organization-name': require('components/wiki/organization-name')
      'sep-row':           require('components/@/sep-row')

    props:
      'subject':
        type: Object
        required: true

    computed:
      staffs: -> @subject.staffs ? []

    methods:
      displayJobs: (staff) ->
        jobs = staff.jobs ? []
        jobs = jobs.map (job) -> model.staff.displayJob(job)
        return jobs.join('、')
</script>


<style lang="less" scoped>
  .staffs{
    .staff{
      width: 20%;
      padding: 10px;
      text-align: center;
      .person-name,
      .organization-name{
        display: inline-block;
        margin-top: 4px;
        font-size: 13px;
      }
      .jobs{
        margin-top: 2px;
        font-size: 12px;
        color: #A2AEBA;
        word-break: break-all;
      }
    }
  }
</style>
