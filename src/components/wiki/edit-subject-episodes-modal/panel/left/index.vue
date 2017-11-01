<template lang="jade">
  .left
    row.-right
      c-button.batch.-gray(@click="createBatch") 批量添加(10条)
      c-button(@click="showModal()") 添加EPISODE
    episode-list(:subject="subject", :episodes="episodes" @edit="showModal")
    edit-modal(v-if="modalOpen", :subject="subject", :episodes="episodes", :episode="editEpisode" @close="hideModal()")
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

      createBatch: ->
        await @confirm('确认一次性添加 10 条 EPISODE ？')
        episodes = await @api.call('episode.createBatch', @subject.id)
        @notify('done', '添加成功')
        @commit('CREATE_EPISODES', episodes)

        # result = await @api.call('episode.create', @subject.id, {
        #   order:      parseFloat(@order)
        #   name:       @name
        #   nameOrigin: @nameOrigin
        #   intro:      @intro
        # })
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
    .button.batch{
      margin-right: 10px;
    }
  }
</style>