<template lang="jade">
  #persons-detail(v-if="person")
    overview(:person="person")
</template>


<script lang="coffee">
  module.exports =
    components:
      'overview': require('./overview')

    data: ->
      person: null

    metaInfo: ->
      title: if @person then @person.name else ''

    activated: ->
      @init()

    methods:
      init: ->
        @person = await api.call('person.get', @routeID, {
          casts: true
        })
</script>