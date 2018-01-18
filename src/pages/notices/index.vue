<template lang="jade">
  #notices(v-if="notices.length")
    .wrap
      list(:notices="notices")
      page-bar(:page="routePage", :size="size", :total="total" @change="changePage")
</template>


<script lang="coffee">
  module.exports =
    components:
      'list':     require('./list')
      'page-bar': require('components/@/page-bar')

    data: ->
      notices: []
      size: 30
      total: 0

    metaInfo: ->
      title: '消息'

    activated: ->
      @init()

    methods:
      init: ->
        @commit('reminder/SET_COUNT', 0)
        result = await @api.call('notice.getAll', {
          types: ['comment']
          page: @routePage
          size: @size
        })
        @notices = result.notices
        @total   = result.total
        await @api.call('notice.read', ['comment'])

      changePage: (page) ->
        @$router.push("##{page}")
</script>


<style lang="less" scoped>
  #notices{
    background-image: url(http://pattern8.com/images/pattern-thumbs/pattern8-pattern-21a.png);
    overflow: hidden;
    .wrap{
      margin: 36px auto;
      width: 800px;
      background-color: #FFF;
      border-radius: 2px;
      .page-bar{
        padding: 30px;
      }
    }
  }
</style>
