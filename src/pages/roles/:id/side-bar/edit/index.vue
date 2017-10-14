<template lang="jade">
  .edit.col
    c-button.-gray(v-show="path === ''" @click="editFace") 编辑：头像
    c-button.-gray(v-show="path === ''" @click="editBase") 编辑：基本档案
</template>


<script lang="coffee">
  module.exports =
    components:
      'c-button':   require('components/@/button')
      'detail-box': require('components/wiki/detail-box')

    props:
      'role':
        type: Object
        required: true

    computed:
      path: -> @$route.meta.path

    methods:
      editFace: ->
        @dispatch('show-upload-wiki-face-modal', {type: 'role', id: @role.id})

      editBase: ->
        @dispatch('show-edit-role-base-modal', @role.id)
</script>


<style lang="less" scoped>
  .edit{
    align-items: stretch;
    .button{
      text-align: left;
      font-weight: 400;
      font-size: 13px;
      margin-bottom: 6px;
    }
  }
</style>