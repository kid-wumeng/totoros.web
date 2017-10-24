<template lang="jade">
  .left
    .row.-right
      c-button(@click="showModal()") 添加STAFF
    staff-list(:subject="subject", :staffs="staffs" @edit="showModal")
    edit-modal(v-if="modalOpen", :subject="subject", :staff="editCast" @close="hideModal()")
</template>


<script lang="coffee">
  module.exports =
    components:
      'c-button':   require('components/@/button')
      'staff-list': require('./staff-list')
      'edit-modal': require('./edit-modal')

    data: ->
      modalOpen: false
      editCast: null

    computed:
      subject: -> @state['edit-subject-staffs-modal'].subject
      staffs:   -> @subject.staffs ? []

    methods:
      showModal: (staff) ->
        @editCast  = staff ? null
        @modalOpen = true

      hideModal: ->
        @editCast  = null
        @modalOpen = false
</script>


<style lang="less" scoped>
  .left{
    box-sizing: border-box;
    width: 600px;
    height: 100%;
    padding: 0 80px 0 30px;
    overflow: scroll;
    >*{
      margin-bottom: 16px;
      &:last-child{
        margin-bottom: 0;
      }
    }
  }
</style>