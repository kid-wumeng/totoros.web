<template lang="jade">
  .face
    user-face(v-if="showUser", :user="user")
    subject-face(v-if="showSubject", :subject="subject" frame)
</template>


<script lang="coffee">
  module.exports =
    components:
      'user-face':    require('components/image/user-face')
      'subject-face': require('components/image/subject-face')

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
  .face{
    box-sizing: border-box;
    .user-face{
      width: 40px;
    }
    .subject-face{
      width: 60px;
    }
  }
</style>