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

    metaInfo: ->
      title: if @role then @role.name else ''
      meta: [{
        name: 'description'
        content: (@role?.intro ? @role?.name) ? ''
      }]

    created: ->
      @listen('UPDATE_ROLE',  @updateRole)

    activated: ->
      @init()

    methods:
      init: ->
        @role = await api.call('role.get', @routeID, {
          casts: true
        })

      updateRole: (role) ->
        if isSame(role, @role)
          for key, value of role
            @role[key] = value
</script>
