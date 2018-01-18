<template lang="jade">
  #organizations-detail(v-if="organization")
    frame(:organization="organization")
</template>


<script lang="coffee">
  module.exports =
    components:
      'frame': require('./frame')

    data: ->
      organization: null

    metaInfo: ->
      title: if @organization then @organization.name else ''

    created: ->
      @listen('UPDATE_ORGANIZATION',  @updateOrganization)

    activated: ->
      @init()

    methods:
      init: ->
        @organization = await api.call('organization.get', @routeID, {
          staffs: true
        })

      updateOrganization: (organization) ->
        if isSame(organization, @organization)
          for key, value of organization
            @organization[key] = value
</script>