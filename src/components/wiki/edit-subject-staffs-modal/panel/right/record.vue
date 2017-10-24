<template lang="jade">
  .record.row.-top.-left
    .left
      .date {{ model.date.display(record.editDate) }}
    .right
      user-name(:user="record.user")
      div.staff(v-if="showNewStaff") {{ displayNewStaff }}
      del.staff(v-if="showOldStaff") {{ displayOldStaff }}
</template>


<script lang="coffee">
  module.exports =
    components:
      'user-name': require('components/user/user-name')

    props:
      'record':
        type: Object
        required: true

    computed:
      type:     -> @record.type
      oldStaff: -> @record.oldStaff
      newStaff: -> @record.newStaff

      showOldStaff: -> ['update', 'delete'].includes(@type)
      showNewStaff: -> ['create', 'update'].includes(@type)

      displayOldStaff: -> @displayStaff(@oldStaff)
      displayNewStaff: -> @displayStaff(@newStaff)

    methods:
      displayStaff: (staff) ->
        jobs = staff.jobs ? []
        jobs = jobs.map (job) -> "#{model.assets.displayStaffJob(job)}"
        jobs = jobs.join(', ')
        if(staff.type is 'person')
          person = staff.person
          person = "##{person.id} #{person.name}"
          person = "[#{person}]"
          return "#{person}　#{jobs}"
        else
          organization = staff.organization
          organization = "##{organization.id} #{organization.name}"
          organization = "[#{organization}]"
          return "#{organization}　#{jobs}"
</script>


<style lang="less" scoped>
  .record{
    padding: 16px 20px;
    &:nth-child(odd){
      background-color: rgba(250, 250, 250, 1);
    }
    .left{
      width: 80px;
      text-align: right;
      .date{
        font-size: 13px;
        color: #A2AEBA;
      }
    }
    .right{
      flex: auto;
      margin-left: 12px;
      .user-name{
        display: inline-block;
        font-size: 13px;
      }
      .staff{
        flex: auto;
        width: 380px;
        word-wrap: break-word;
        box-sizing: border-box;
        display: block;
        margin-top: 6px;
        font-weight: 600;
        font-size: 13px;
      }
      del.staff{
        color: #CCC;
        font-weight: 400;
      }
    }
  }
</style>
