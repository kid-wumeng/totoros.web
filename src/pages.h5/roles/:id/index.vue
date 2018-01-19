<template lang="jade">
  #roles-detail(v-if="role")
    overview(:role="role")
</template>


<script lang="coffee">
  module.exports =
    components:
      'overview': require('./overview')

    data: ->
      role: null

    metaInfo: ->
      title: if @role then @role.name else ''

    activated: ->
      @init()

    methods:
      init: ->
        @role = await api.call('role.get', @routeID, {
          casts: true
        })
</script>