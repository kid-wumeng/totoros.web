<template lang="jade">
  action.action-subject(icon="fa-clone" label="作品" @click="search")
</template>


<script lang="coffee">
  module.exports =
    components:
      'action': require('components/@/action')

    methods:
      search: ->
        subject = await @dispatch('search-modal/show', {allowType: 'subject'})
        @$emit('add-subject', subject)
</script>