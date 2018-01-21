<template lang="jade">
  #wiki
    c-button(@click="commit('create-subject-modal/SHOW')") 创建作品
    c-button(@click="commit('create-role-modal/SHOW')") 创建角色
    c-button(@click="commit('create-person-modal/SHOW')") 创建人物
    c-button(@click="commit('create-organization-modal/SHOW')") 创建团体

    create-subject-modal
    create-role-modal
    create-person-modal
    create-organization-modal
</template>


<script lang="coffee">
  module.exports =
    components:
      'c-input':  require('components/@/input')
      'c-button': require('components/@/button')
      'page-bar': require('components/@/page-bar')
      'create-subject-modal':      require('components/wiki/create-subject-modal')
      'create-role-modal':         require('components/wiki/create-role-modal')
      'create-person-modal':       require('components/wiki/create-person-modal')
      'create-organization-modal': require('components/wiki/create-organization-modal')

    metaInfo: ->
      title: '维基'
</script>


<style lang="less" scoped>
  #wiki{
    margin: 60px auto;
    width: 800px;
    >*{
      margin-right: 16px;
    }
  }
</style>
