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

    watch:
      'routePage': -> @init()

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
    width: 100%;
    .user-card{
      width: 25%;
      padding: 10px;
    }
    .page-bar{
      margin-top: 20px;
    }
  }
</style>