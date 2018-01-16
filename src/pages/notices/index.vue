<template lang="jade">
  #notices
    list(:notices="notices")
</template>


<script lang="coffee">
  module.exports =
    components:
      'list': require('./list')

    data: ->
      notices: []
      total: 0

    created: ->
      @init()

    methods:
      init: ->
        result = await api.call('notice.getAll', {
          types: ['comment']
          page: @routePage
        })
        @notices = result.notices
        @total   = result.total

      changePage: (page) ->
        @$router.push("##{page}")
</script>


<style lang="less" scoped>
  #notices{
    margin: 20px auto;
    width: 600px;
  }
</style>
