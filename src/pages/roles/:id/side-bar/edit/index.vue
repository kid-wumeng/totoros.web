<template lang="jade">
  detail-box.edit.col(v-if="login")
    .wrap
      .edit-action.-gray(v-show="path === ''" @click="editFace") 编辑：头像
      .edit-action.-gray(v-show="path === ''" @click="editBase") 编辑：基本档案

    edit-role-base-modal
    wiki-face-modal
</template>


<script lang="coffee">
  module.exports =
    components:
      'detail-box':           require('components/wiki/detail-box')
      'edit-role-base-modal': require('components/wiki/edit-role-base-modal')
      'wiki-face-modal':      require('components/wiki/wiki-face-modal')

    props:
      'role':
        type: Object
        required: true

    computed:
      path: -> @$route.meta.path

    methods:
      editFace: ->
        @dispatch('wiki-face-modal/show', {type: 'role', id: @role.id})

      editBase: ->
        @dispatch('edit-role-base-modal/show', @role.id)
</script>


<style lang="less" scoped>
  .edit{
    align-items: stretch;
    .wrap{
      padding: 6px;
      .edit-action{
        padding: 8px 12px;
        text-align: left;
        font-weight: 500;
        font-size: 13px;
        cursor: pointer;
        border-radius: 3px;
        &:hover{
          color: #FFF;
          background-image: linear-gradient(-180deg, #66C277 0%, #16a085 90%);
        }
      }
    }
  }
</style>