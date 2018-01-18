<template lang="jade">
  action.action-role(icon="fa-clone" label="角色" @click="search")
</template>


<script lang="coffee">
  module.exports =
    components:
      'action': require('components/@/action')

    methods:
      search: ->
        role = await @dispatch('search-modal/show', {allowType: 'role'})
        @$emit('add-role', role)
</script>