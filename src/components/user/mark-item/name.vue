<template lang="jade">
  .name
    user-name(v-if="showUser", :user="user")
    subject-name(v-if="showSubject", :subject="subject")
</template>


<script lang="coffee">
  module.exports =
    components:
      'user-name':    require('components/user/user-name')
      'subject-name': require('components/wiki/subject-name')

    props:
      'mark':
        type: Object
        required: true
      'showUser':
        type: Boolean
        default: false
      'showSubject':
        type: Boolean
        default: false

    computed:
      user:    -> @mark.user
      subject: -> @mark.subject
</script>


<style lang="less" scoped>
  .name{
    .user-name{
      font-size: 13px;
    }
    .subject-name{
      font-size: 14px;
      font-weight: 600;
      color: #273340;
    }
  }
</style>