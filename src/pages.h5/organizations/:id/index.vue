<template lang="jade">
  #organizations-detail(v-if="organization")
    overview(:organization="organization")
</template>


<script lang="coffee">
  module.exports =
    components:
      'overview': require('./overview')

    data: ->
      organization: null

    metaInfo: ->
      title: if @organization then @organization.name else ''

    activated: ->
      @init()

    methods:
      init: ->
        @organization = await api.call('organization.get', @routeID, {
          staffs: true
        })
</script>