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

    created: ->
      @listen('UPDATE_PERSON',  @updatePerson)

    methods:
      init: ->
        @person = await api.call('person.get', @routeID)

      updatePerson: (person) ->
        if isSame(person, @person)
          for key, value of person
            @person[key] = value
</script>
