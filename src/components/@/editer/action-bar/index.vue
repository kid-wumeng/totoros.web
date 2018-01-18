<template lang="jade">
  .action-bar.row.-left
    action-picture(@add-picture="addPicture")
    action-subject(@add-subject="addSubject")
    action-role(@add-role="addRole")
    action-person(@add-person="addPerson")
    action-organization(@add-organization="addOrganization")
</template>


<script lang="coffee">
  module.exports =
    components:
      'action-picture':      require('./action-picture')
      'action-subject':      require('./action-subject')
      'action-role':         require('./action-role')
      'action-person':       require('./action-person')
      'action-organization': require('./action-organization')

    methods:
      addPicture:      (picture)      -> @$emit('add-picture', picture)
      addSubject:      (subject)      -> @$emit('add-subject', subject)
      addRole:         (role)         -> @$emit('add-role', role)
      addPerson:       (person)       -> @$emit('add-person', person)
      addOrganization: (organization) -> @$emit('add-organization', organization)
</script>


<style lang="less" scoped>
  .action-bar{
  }
</style>