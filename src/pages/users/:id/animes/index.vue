<template lang="jade">
  #user-detail-animes
    mark-list(:marks="marks")
</template>


<script lang="coffee">
  module.exports =
    components:
      'mark-list': require('components/user/mark-list')

    props:
      'user':
        type: Object
        required: true

    computed:
      marks: -> @state['user-detail'].anime_marks

    created: ->
      @init()

    watch:
      '$route': ->
        @init()

    methods:
      init: ->
        @dispatch('user-detail/get-anime-marks', {id: @user.id})
</script>


<style lang="less" scoped>
  #user-detail-animes{
    width: 800px;
  }
</style>