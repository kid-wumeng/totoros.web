<template lang="jade">
  .banner
    user-banner(:user="user" @click="click")
    user-banner-modal
</template>


<script lang="coffee">
  module.exports =
    components:
      'user-banner':       require('components/image/user-banner')
      'user-banner-modal': require('components/user/user-banner-modal')

    props:
      'user':
        type: Object
        required: true

    methods:
      click: ->
        if @isMe(@user)
          @commit('user-banner-modal/SHOW')
</script>


<style lang="less" scoped>
  .banner{
    width: 100%;
  }
</style>