<template lang="jade">
  #subjects-detail(v-if="subject")
    overview(:subject="subject")
</template>


<script lang="coffee">
  module.exports =
    components:
      'overview': require('./overview')

    data: ->
      subject: null

    activated: ->
      @init()

    methods:
      init: ->
        @subject = await api.call('subject.get', @routeID, {
          episodes: true
          casts:    true
          staffs:   true
          posts:    true
          marks:    true
        })
</script>
