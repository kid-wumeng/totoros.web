<template lang="jade">
  #wiki.-center
    //- c-button(@click="commit('SHOW_SUBMIT_SUBJECT_MODAL')") 提交作品收录
    c-button(@click="dispatch('edit-subject-base-modal/show', 1)") 编辑作品
    submit-subject-modal
    edit-subject-base-modal
</template>


<script lang="coffee">
  module.exports =
    components:
      'c-button': require('components/@/button')
      'submit-subject-modal':    require('components/wiki/submit-subject-modal')
      'edit-subject-base-modal': require('components/wiki/edit-subject-base-modal')
</script>


<style lang="less" scoped>
  #wiki{
  }
</style>
