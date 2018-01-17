<template lang="jade">
  row.item(@click="click")
    .left
      person-face(v-if="staff.type === 'person'", :person="staff.person")
      organization-face(v-if="staff.type === 'organization'", :organization="staff.organization")
    .right
      .name(v-if="staff.type === 'person'") {{ staff.person.name }}
      .name(v-if="staff.type === 'organization'") {{ staff.organization.name }}
      .jobs {{ jobs }}
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
      'staff':
        type: Object
        required: true

    computed:
      jobs: ->
        jobs = @staff.jobs ? []
        jobs = jobs.map (job) => @model.staff.displayJob(job)
        return jobs.join('、')

    methods:
      click: ->
        switch @staff.type
          when 'person'       then @toPersonPage(@staff.person)
          when 'organization' then @toOrganizationPage(@staff.organization)
</script>


<style lang="less" scoped>
  .item{
    padding: 12px;
    cursor: pointer;
    &:nth-child(odd){
      background-color: rgb(249, 249, 249);
    }
    .left{
      .person-face,
      .organization-face{
        width: 48px;
      }
    }
    .right{
      margin-left: 10px;
      margin-top: -2px;
      .name{
        font-weight: 500;
        font-size: 13px;
      }
      .jobs{
        margin-top: 1px;
        font-size: 12px;
        color: #A2AEBA;
      }
    }
  }
</style>