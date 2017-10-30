<template lang="jade">
  .left
    .row.-right
      c-button(@click="showModal()") 添加EPISODE
    episode-list(:subject="subject", :episodes="episodes" @edit="showModal")
    edit-modal(v-if="modalOpen", :subject="subject", :episode="editEpisode" @close="hideModal()")
</template>


<script lang="coffee">
  module.exports =
    components:
      'c-button':     require('components/@/button')
      'episode-list': require('./episode-list')
      'edit-modal':   require('./edit-modal')

    data: ->
      modalOpen: false
      editEpisode: null

    computed:
      subject:  -> @state['edit-subject-episodes-modal'].subject
      episodes: -> @state['edit-subject-episodes-modal'].episodes

    methods:
      showModal: (episode) ->
        @editEpisode = episode ? null
        @modalOpen   = true

      hideModal: ->
        @editEpisode = null
        @modalOpen   = false
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