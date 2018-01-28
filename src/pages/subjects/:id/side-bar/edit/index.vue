<template lang="jade">
  detail-box.edit.col(v-if="show")
    .wrap
      .edit-action(v-show="path === ''" @click="editFace")      编辑：作品封面
      .edit-action(v-show="path === ''" @click="editBase")      编辑：基本档案
      .edit-action(v-show="path === ''" @click="editResources") 编辑：资源Links
      //- .edit-action(v-show="path === ''" @click="editWorld")     编辑：世界观
      .edit-action(v-show="path === 'episodes'" @click="editEpisodes")  编辑：Episodes
      .edit-action(v-show="path === 'casts'"    @click="editCasts")     编辑：Casts
      .edit-action(v-show="path === 'staffs'"   @click="editStaffs")    编辑：Staffs

    edit-subject-base-modal
    edit-subject-resources-modal
    edit-subject-episodes-modal
    edit-subject-casts-modal
    edit-subject-staffs-modal
    wiki-face-modal
</template>


<script lang="coffee">
  module.exports =
    components:
      'detail-box':                   require('components/wiki/detail-box')
      'edit-subject-base-modal':      require('components/wiki/edit-subject-base-modal')
      'edit-subject-resources-modal': require('components/wiki/edit-subject-resources-modal')
      'edit-subject-episodes-modal':  require('components/wiki/edit-subject-episodes-modal')
      'edit-subject-casts-modal':     require('components/wiki/edit-subject-casts-modal')
      'edit-subject-staffs-modal':    require('components/wiki/edit-subject-staffs-modal')
      'wiki-face-modal':              require('components/wiki/wiki-face-modal')

    props:
      'subject':
        type: Object
        required: true

    computed:
      path: -> @$route.meta.path
      show: ->
        if(!@login)
          return false
        switch @path
          when ''         then true
          when 'episodes' then true
          when 'casts'    then true
          when 'staffs'   then true
          else false

    methods:
      editFace: ->
        @dispatch('wiki-face-modal/show', {type: 'subject', id: @subject.id})

      editBase: ->
        @dispatch('edit-subject-base-modal/show', @subject.id)

      editResources: ->
        @dispatch('edit-subject-resources-modal/show', @subject.id)

      editWorld: ->
        @dispatch('edit-subject-world-modal/show', @subject.id)

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