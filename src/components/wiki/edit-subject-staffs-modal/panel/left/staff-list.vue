<template lang="jade">
  .staff-list
    .staff.row(v-for="(staff, index) in staffs", :key="index")

      .row.-left(v-if="staff.type === 'person'")
        person-face(:person="staff.person" square)
        .person {{ displayPerson(staff.person) }}

      .row.-left(v-if="staff.type === 'organization'")
        organization-face(:organization="staff.organization" square)
        .organization {{ displayPerson(staff.organization) }}

      .row.-right
        .hint(v-if="staff.persons && staff.persons.length") JOBS：
        .job(v-for="(job, index) in staff.jobs", :key="index") {{ model.assets.displayStaffJob(job) }}
        c-button.del.-gray(@click="del(staff)") 删除
        c-button.edit(@click="$emit('edit', staff)") 编辑
</template>


<script lang="coffee">
  module.exports =
    components:
      'person-face':       require('components/image/person-face')
      'organization-face': require('components/image/organization-face')
      'c-button':          require('components/@/button')

    props:
      'subject':
        type: Object
        required: true
      'staffs':
        type: Array
        default: -> []

    methods:
      displayPerson: (person) ->
        id   = person?.id
        name = person?.name
        return "##{id} #{name}"

      displayOrganization: (organization) ->
        id   = organization?.id
        name = organization?.name
        return "##{id} #{name}"

      del: (staff) ->
        sid  = @subject.id
        pid  = staff.person?.id
        oid  = staff.organization?.id
        type = staff.type
        result = await @api.call('staff.remove', staff.id)
        @notify('done', '删除成功')
        @commit('REMOVE_STAFF', result.staff)
        @commit('edit-subject-staffs-modal/ADD_RECORD', result.record)
</script>


<style lang="less" scoped>
  .staff-list{
    >*{
      margin-bottom: 16px;
      &:last-child{
        margin-bottom: 0;
      }
    }
    .person-face{
      width: 32px;
    }
    .organization-face{
      width: 32px;
    }
    .person{
      margin-left: 10px;
      font-weight: 600;
      font-size: 13px;
    }
    .organization{
      margin-left: 10px;
      font-weight: 600;
      font-size: 13px;
    }
    .job{
      font-size: 13px;
      margin-right: 10px;
    }
    .button.del{
      margin-right: 10px;
    }
  }
</style>