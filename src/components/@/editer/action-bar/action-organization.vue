<template lang="jade">
  action.action-organization(icon="fa-clone" label="团体" @click="search")
</template>


<script lang="coffee">
  module.exports =
    components:
      'action': require('components/@/action')

    methods:
      search: ->
        organization = await @dispatch('search-modal/show', {allowType: 'organization'})
        @$emit('add-organization', organization)
</script>