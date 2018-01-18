<template lang="jade">
  #subjects-detail(v-if="subject")
    frame(:subject="subject")
</template>


<script lang="coffee">
  module.exports =
    components:
      'frame': require('./frame')

    data: ->
      subject: null

    metaInfo: ->
      title: if @subject then @subject.name else ''

    created: ->
      @listen('UPDATE_SUBJECT',  @updateSubject)
      @listen('CREATE_CAST',     @createCast)
      @listen('REMOVE_CAST',     @removeCast)
      @listen('CREATE_STAFF',    @createStaff)
      @listen('REMOVE_STAFF',    @removeStaff)
      @listen('CREATE_EPISODE',  @createEpisode)
      @listen('CREATE_EPISODES', @createEpisodes)
      @listen('REMOVE_EPISODE',  @removeEpisode)

    activated: ->
      @init()

    methods:
      init: ->
        @subject = await api.call('subject.get', @routeID, {
          episodes: true
          casts:    true
          staffs:   true
          marks:    true
          posts:    true
        })

      updateSubject:  (subject)  -> @init()
      createCast:     (cast)     -> @init()
      removeCast:     (cast)     -> @init()
      createStaff:    (staff)    -> @init()
      removeStaff:    (staff)    -> @init()
      createEpisode:  (episode)  -> @init()
      createEpisodes: (episodes) -> @init()
      removeEpisode:  (episode)  -> @init()
</script>
