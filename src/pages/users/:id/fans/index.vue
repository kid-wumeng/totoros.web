<template lang="jade">
  #user-detail-fans
    grid
      user-card(v-for="fan in fans", :key="fan.id", :user="fan")
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
      fans:  []
      size:  0
      total: 0

    activated: ->
      @init()

    methods:
      init: ->
        result = await api.call('user.getFans', @user.id, {
          page: @routePage
        })
        @fans = result.fans
        @size  = result.size
        @total = result.total

      change: (page) ->
        @$router.push({
          hash: "##{page}"
        })
</script>


<style lang="less" scoped>
  #user-detail-fans{
    box-sizing: border-box;
    width: 100%;
    .user-card{
      width: 20%;
    }
    .page-bar{
      margin-top: 20px;
      margin-left: 15px;
      margin-right: 15px;
    }
  }
</style>