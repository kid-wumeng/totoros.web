<template lang="jade">
  .edit.col
    c-button.-gray(v-show="path === ''" @click="editFace") 编辑：封面
    c-button.-gray(v-show="path === ''" @click="editBase") 编辑：基本档案
    c-button.-gray(v-show="path === ''")         编辑：资源Links
    c-button.-gray(v-show="path === 'world'")    编辑：世界观
    c-button.-gray(v-show="path === 'casts'")    编辑：Casts
    c-button.-gray(v-show="path === 'staffs'")   编辑：Staffs
    c-button.-gray(v-show="path === 'episodes'") 编辑：Episodes
</template>


<script lang="coffee">
  module.exports =
    components:
      'c-button':   require('components/@/button')
      'detail-box': require('components/wiki/detail-box')

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