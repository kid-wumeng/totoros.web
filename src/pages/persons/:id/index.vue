<template lang="jade">
  #persons-detail(v-if="person")
    frame(:person="person")
</template>


<script lang="coffee">
  module.exports =
    components:
      'frame': require('./frame')

    data: ->
      person: null

    metaInfo: ->
      title: if @person then @person.name else ''

    created: ->
      @listen('UPDATE_PERSON',  @updatePerson)

    activated: ->
      @init()

    methods:
      init: ->
        @person = await api.call('person.get', @routeID, {
          casts:  true
          staffs: true
        })

      updatePerson: (person) ->
        if isSame(person, @person)
          for key, value of person
            @person[key] = value
</script>
