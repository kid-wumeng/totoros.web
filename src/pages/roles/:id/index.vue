<template lang="jade">
  #roles-detail(v-if="role")
    frame(:role="role")
</template>


<script lang="coffee">
  module.exports =
    components:
      'frame': require('./frame')

    data: ->
      role: null

    created: ->
      @listen('UPDATE_ROLE',  @updateRole)

    methods:
      init: ->
        @role = await api.call('role.get', @routeID)

      updateRole: (role) ->
        if isSame(role, @role)
          for key, value of role
            @role[key] = value
</script>
