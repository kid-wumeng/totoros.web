<template lang="jade">
  #subjects-detail-casts
    list(:casts="casts")
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
      casts: []

    created: ->
      @init()
      @listen('CREATE_CAST', @createCast)
      @listen('UPDATE_CAST', @updateCast)
      @listen('REMOVE_CAST', @removeCast)

    activated: ->
      @init()

    methods:
      init: ->
        @casts = await api.call('cast.getAll', {sid: @subject.id})

      createCast: (cast) ->
        if @isSame(cast.subject, @subject)
          @casts.unshift(cast)

      updateCast: (cast) -> @updateItem(@casts, cast)
      removeCast: (cast) -> @removeItem(@casts, cast)
</script>


<style lang="less" scoped>
  #subjects-detail-casts{
    padding-top: 16px;
  }
</style>
