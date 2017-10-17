<template lang="jade">
  cdn-image.user-face(:path="path", square cover @click="click")
</template>


<script lang="coffee">
  module.exports =
    components:
      'cdn-image': require('components/image/cdn-image')

    props:
      'user':
        type: Object
        required: true
      'prevent':
        type: Boolean
        default: false

    computed:
      id:      -> @user.id
      version: -> @user.face?.version
      path:    -> if @version then "users/#{@id}/face?v=#{@version}" else ''

    methods:
      click: ->
        if @prevent
          @$emit('click')
        else
          @toUserPage(@user)
</script>


<style lang="less" scoped>
  .user-face{
    border-radius: 3px;
    cursor: pointer;
  }
</style>
