<template lang="jade">
  action.action-person(icon="fa-clone" label="人物" @click="search")
</template>


<script lang="coffee">
  module.exports =
    components:
      'action': require('components/@/action')

    methods:
      search: ->
        person = await @dispatch('search-modal/show', {allowType: 'person'})
        @dispatch('input-content/mountPerson', person)
</script>