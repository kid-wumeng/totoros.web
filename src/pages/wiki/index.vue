<template lang="jade">
  #wiki.-center
    c-button(@click="commit('SHOW_SUBMIT_SUBJECT_MODAL')") 提交作品收录
    submit-subject-modal
</template>


<script lang="coffee">
  module.exports =
    components:
      'c-button': require('components/@/button')
      'submit-subject-modal': require('components/wiki/submit-subject-modal')
</script>


<style lang="less" scoped>
  #wiki{
  }
</style>
