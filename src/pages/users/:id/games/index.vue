<template lang="jade">
  #user-detail-games
    row.-between
      mark-type-radio-bar(:user="user")
      mark-status-radio-bar(:user="user")
    mark-list(:marks="marks")
    page-bar(:user="user")
</template>


<script lang="coffee">
  module.exports =
    components:
      'mark-type-radio-bar':   require('components/user/mark-type-radio-bar')
      'mark-status-radio-bar': require('components/user/mark-status-radio-bar')
      'mark-list':             require('components/user/mark-list')
      'page-bar':              require('components/user/page-bar')

    props:
      'user':
        type: Object
        required: true

    computed:
      type: ->
        if @$route.query.type
          return 'game-' + @$route.query.type
        else
          return 'game'

      status: -> @$route.query.status
      page:   -> @routePage
      marks:  -> @state['user-detail'].game_marks

    created: ->
      @init()

    watch:
      'type':   -> @init()
      'status': -> @init()
      'page':   -> @init()

    methods:
      init: ->
        @dispatch('user-detail/get-game-marks', {
          id:     @user.id
          type:   @type
          status: @status
          page:   @page
        })
</script>


<style lang="less" scoped>
  #user-detail-games{
    .mark-list{
      margin-top: 20px;
    }
  }
</style>