<template lang="jade">
  #wiki
    c-button(@click="commit('create-subject-modal/SHOW')") 创建作品
    c-button(@click="commit('create-role-modal/SHOW')") 创建角色
    c-button(@click="commit('create-person-modal/SHOW')") 创建人物
    c-button(@click="commit('create-organization-modal/SHOW')") 创建团体
</template>


<script lang="coffee">
  module.exports =
    components:
      'c-input':  require('components/@/input')
      'c-button': require('components/@/button')
      'page-bar': require('components/@/page-bar')

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
