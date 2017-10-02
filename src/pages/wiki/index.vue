<template lang="jade">
  #wiki.-center
    .button(@click="commit('SHOW_SUBMIT_SUBJECT_MODAL')") 提交作品收录
    submit-subject-modal
</template>


<script lang="coffee">
  module.exports =
    components:
      'submit-subject-modal': require('components/wiki/SubmitSubjectModal')
</script>


<style lang="less" scoped>
  #wiki{
  }
</style>
