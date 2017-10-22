<template lang="jade">
  #wiki.-center
    c-button(@click="commit('create-subject-modal/SHOW')") 创建作品
    c-button(@click="commit('create-role-modal/SHOW')") 创建角色
    c-button(@click="commit('create-person-modal/SHOW')") 创建人物
    c-button(@click="commit('create-organization-modal/SHOW')") 创建团体
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
