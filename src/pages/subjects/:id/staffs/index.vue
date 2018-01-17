<template lang="jade">
  #subjects-detail-staffs
    list(:staffs="staffs")
</template>


<script lang="coffee">
  module.exports =
    components:
      'list': require('./list')

    props:
      'subject':
        type: Object
        required: true

    data: ->
      staffs: []

    created: ->
      @init()
      @listen('CREATE_STAFF', @createStaff)
      @listen('UPDATE_STAFF', @updateStaff)
      @listen('REMOVE_STAFF', @removeStaff)

    activated: ->
      @init()

    methods:
      init: ->
        @staffs = await api.call('staff.getAll', {sid: @subject.id})

      createStaff: (staff) ->
        if @isSame(staff.subject, @subject)
          @staffs.unshift(staff)

      updateStaff: (staff) -> @updateItem(@staffs, staff)
      removeStaff: (staff) -> @removeItem(@staffs, staff)
</script>


<style lang="less" scoped>
  #subjects-detail-staffs{
    padding-top: 16px;
  }
</style>
