<template lang="jade">
  #user-detail-idols
    grid
      user-card(v-for="idol in idols", :key="idol.id", :user="idol")
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
      idols: []

    watch:
      'routePage': -> @init()

    methods:
      init: ->
        result = await api.call('user.getIdols', @user.id, {
          page: @routePage
        })
        @idols = result.idols
</script>


<style lang="less" scoped>
  #user-detail-idols{
    width: 100%;
    .user-card{
      width: 25%;
      padding: 10px;
    }
  }
</style>