<template lang="jade">
  #user-detail-idols
    grid
      user-card(v-for="idol in idols", :key="idol.id", :user="idol")
    page-bar(:page="routePage", :size="size", :total="total", @change="change")
</template>


<script lang="coffee">
  module.exports =
    components:
      'grid':      require('components/@/grid')
      'user-card': require('components/user/user-card')
      'page-bar':  require('components/@/page-bar')

    props:
      'user':
        type: Object
        required: true

    data: ->
      idols: []
      size:  0
      total: 0

    watch:
      'routePage': -> @init()

    methods:
      init: ->
        result = await api.call('user.getIdols', @user.id, {
          page: @routePage
        })
        @idols = result.idols
        @size  = result.size
        @total = result.total

      change: (page) ->
        @$router.push({
          hash: "##{page}"
        })
</script>


<style lang="less" scoped>
  #user-detail-idols{
    width: 100%;
    .user-card{
      width: 25%;
      padding: 5px;
    }
    .page-bar{
      margin-top: 20px;
    }
  }
</style>