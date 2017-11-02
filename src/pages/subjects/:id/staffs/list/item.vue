<template lang="jade">
  row.item.-top
    .left
      person-face(v-if="type === 'person'", :person="person" square border)
      organization-face(v-if="type === 'organization'", :organization="organization" square border)
    .right
      row.-center
        person-name(v-if="type === 'person'", :person="person")
        organization-name(v-if="type === 'organization'", :organization="organization")
        span.nameOrigin(v-if="type === 'person'") {{ person.nameOrigin }}
        span.nameOrigin(v-if="type === 'organization'") {{ organization.nameOrigin }}
      sep-row
        span.job(v-for="(job, index) in jobs", :key="index") {{ model.assets.displayStaffJob(job) }}
</template>


<script lang="coffee">
  module.exports =
    components:
      'sep-row':           require('components/@/sep-row')
      'person-face':       require('components/image/person-face')
      'person-name':       require('components/wiki/person-name')
      'organization-face': require('components/image/organization-face')
      'organization-name': require('components/wiki/organization-name')

    props:
      'staff':
        type: Object
        required: true

    computed:
      person:       -> @staff.person
      organization: -> @staff.organization
      type:         -> @staff.type
      jobs:         -> @staff.jobs
</script>


<style lang="less" scoped>
  .item{
    padding-bottom: 10px;
    border-bottom: 1px dotted #EAEAEA;
    margin-bottom: 10px;
    >.right{
      position: relative;
      top: 0px;
    }
    .person-face{
      width: 72px;
      margin-right: 12px;
    }
    .organization-face{
      width: 72px;
      margin-right: 12px;
    }
    .nameOrigin{
      margin-left: 7px;
      font-size: 12px;
      color: #A2AEBA;
    }
    .job{
      position: relative;
      margin-top: 2px;
      font-size: 12px;
      color: #A2AEBA;
    }
  }
</style>
