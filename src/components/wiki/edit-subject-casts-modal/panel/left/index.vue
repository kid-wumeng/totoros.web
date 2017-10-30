<template lang="jade">
  .left
    .row.-right
      c-button(@click="showModal()") 添加CAST
    cast-list(:subject="subject", :casts="casts" @edit="showModal")
    edit-modal(v-if="modalOpen", :subject="subject", :cast="editCast" @close="hideModal()")
</template>


<script lang="coffee">
  module.exports =
    components:
      'c-button':   require('components/@/button')
      'cast-list':  require('./cast-list')
      'edit-modal': require('./edit-modal')

    data: ->
      modalOpen: false
      editCast: null

    computed:
      subject: -> @state['edit-subject-casts-modal'].subject
      casts:   -> @state['edit-subject-casts-modal'].casts

    methods:
      showModal: (cast) ->
        @editCast  = cast ? null
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