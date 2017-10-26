<template lang="jade">
  .edit.col
    c-button.-gray(v-show="path === ''" @click="editFace")       编辑：封面
    c-button.-gray(v-show="path === ''" @click="editBase")       编辑：基本档案
    c-button.-gray(v-show="path === ''" @click="editResources")  编辑：资源Links
    c-button.-gray(v-show="path === 'world'")    编辑：世界观
    c-button.-gray(v-show="path === 'episodes'" @click="editEpisodes")   编辑：Episodes
    c-button.-gray(v-show="path === 'casts'" @click="editCasts")   编辑：Casts
    c-button.-gray(v-show="path === 'staffs'" @click="editStaffs") 编辑：Staffs

    edit-subject-resources-modal
    edit-subject-episodes-modal
    edit-subject-casts-modal
    edit-subject-staffs-modal
</template>


<script lang="coffee">
  module.exports =
    components:
      'c-button':                     require('components/@/button')
      'edit-subject-resources-modal': require('components/wiki/edit-subject-resources-modal')
      'edit-subject-episodes-modal':  require('components/wiki/edit-subject-episodes-modal')
      'edit-subject-casts-modal':     require('components/wiki/edit-subject-casts-modal')
      'edit-subject-staffs-modal':    require('components/wiki/edit-subject-staffs-modal')

    props:
      'subject':
        type: Object
        required: true

    computed:
      path: -> @$route.meta.path

    methods:
      editFace: ->
        @dispatch('wiki-face-modal/show', {type: 'subject', id: @subject.id})

      editBase: ->
        @dispatch('edit-subject-base-modal/show', @subject.id)

      editResources: ->
        @dispatch('edit-subject-resources-modal/show', @subject.id)

      editEpisodes: ->
        @dispatch('edit-subject-episodes-modal/show', @subject.id)

      editCasts: ->
        @dispatch('edit-subject-casts-modal/show', @subject.id)

      editStaffs: ->
        @dispatch('edit-subject-staffs-modal/show', @subject.id)
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