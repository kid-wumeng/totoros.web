<template lang="jade">
  .edit.col
      c-button.-gray(v-if="path === ''", @click="dispatch('show-edit-subject-base-modal')") 编辑：基本档案
      c-button.-gray(v-if="path === ''")         编辑：资源Links
      c-button.-gray(v-if="path === 'world'")    编辑：世界观
      c-button.-gray(v-if="path === 'casts'")    编辑：Casts
      c-button.-gray(v-if="path === 'staffs'")   编辑：Staffs
      c-button.-gray(v-if="path === 'episodes'") 编辑：Episodes
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