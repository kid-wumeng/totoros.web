<template lang="jade">
  #user-detail-fans
    grid
      user-card(v-for="fan in fans", :key="fan.id", :user="fan")
    //- page-bar(:user="user")
</template>


<script lang="coffee">
  module.exports =
    components:
      'grid':      require('components/@/grid')
      'user-card': require('components/user/user-card')

    props:
      'user':
        type: Object
        required: true

    data: ->
      fans: []

    watch:
      'routePage': -> @init()

    methods:
      init: ->
        result = await api.call('user.getFans', @user.id, {
          page: @routePage
        })
        @fans = result.fans
</script>


<style lang="less" scoped>
  #user-detail-fans{
    width: 100%;
    .user-card{
      padding: 5px;
      width: 25%;
    }
  }
</style>