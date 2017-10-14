<template lang="jade">
  .face
    user-face(v-if="type === 'user'", :user="result")
    subject-face(v-else-if="type === 'subject'", :subject="result")
    role-face(v-else-if="type === 'role'", :role="result")
    person-face(v-else-if="type === 'person'", :person="result")
    organization-face(v-else-if="type === 'organization'", :organization="result")
</template>


<script lang="coffee">
  module.exports =
    components:
      'user-face':         require('components/image/user-face')
      'subject-face':      require('components/image/subject-face')
      'role-face':         require('components/image/role-face')
      'person-face':       require('components/image/person-face')
      'organization-face': require('components/image/organization-face')

    props:
      'result':
        type: Object
        required: true

    computed:
      type: -> @state['search-modal'].type
</script>


<style lang="less" scoped>
  .face{
    >*{
      width: 100%;
    }
  }
</style>