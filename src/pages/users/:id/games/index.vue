<template lang="jade">
  #user-detail-games
    row.action-bar.-between
      mark-type-radio-bar(:user="user")
      mark-status-radio-bar(:user="user")
    .wrap
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

    data: ->
      marks: []

    computed:
      type: ->
        if @$route.query.type
          return 'game-' + @$route.query.type
        else
          return 'game'

      status: -> @$route.query.status

    created: ->
      @listen('UPDATE_MARK', @updateMark)
      @listen('REMOVE_MARK', @removeMark)

    activated: -> @init()

    methods:
      init: ->
        result = await api.call('mark.getAll', {
          uid:    @user.id
          types:  @model.subject.unfoldType(@type)
          status: @status
          page:   @routePage
          sort:   '-average'
        })
        @marks = result.marks

      updateMark: (mark) -> @updateItem(@marks, mark)
      removeMark: (mark) -> @removeItem(@marks, mark)
</script>


<style lang="less" scoped>
  #user-detail-games{
    width: 100%;
    >.action-bar{
      margin: 0 auto;
      width: 1000px;
    }
    >.wrap{
      background-color: #FFF;
      border-bottom: 1px solid #F2F2F2;
      overflow: hidden;
      margin-top: 24px;
      .mark-list{
        width: 1000px;
        margin: 0 auto;
      }
    }
    .user-page-bar{
      width: 1000px;
      margin: 0 auto;
      margin-top: 24px;
      margin-bottom: 72px;
    }
  }
</style>