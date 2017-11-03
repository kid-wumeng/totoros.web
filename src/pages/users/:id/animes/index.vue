<template lang="jade">
  #user-detail-animes
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

    data: ->
      marks: []

    computed:
      type: ->
        if @$route.query.type
          return 'anime-' + @$route.query.type
        else
          return 'anime'

      status: -> @$route.query.status

    watch:
      'type':      -> @init()
      'status':    -> @init()
      'routePage': -> @init()

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
</script>


<style lang="less" scoped>
  #user-detail-animes{
    .mark-list{
      margin-top: 24px;
    }
  }
</style>