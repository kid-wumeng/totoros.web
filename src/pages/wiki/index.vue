<template lang="jade">
  #wiki.-center
    //- c-button(@click="commit('SHOW_CREATE_SUBJECT_MODAL')") 提交作品收录
    c-button(@click="dispatch('show-edit-subject-base-modal', 1)") 编辑作品
</template>


<script lang="coffee">
  module.exports =
    components:
      'c-button': require('components/@/button')
</script>


<style lang="less" scoped>
  #wiki{
  }
</style>
