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

    created: ->
      @listen('UPDATE_SUBJECT',  @updateSubject)
      @listen('CREATE_CAST',     @createCast)
      @listen('REMOVE_CAST',     @removeCast)
      @listen('CREATE_STAFF',    @createStaff)
      @listen('REMOVE_STAFF',    @removeStaff)
      @listen('CREATE_EPISODE',  @createEpisode)
      @listen('CREATE_EPISODES', @createEpisodes)
      @listen('REMOVE_EPISODE',  @removeEpisode)

    methods:
      init: ->
        @subject = await api.call('subject.get', @routeID, {
          episodes: true
          casts:    true
          staffs:   true
          marks:    true
        })

      updateSubject: (subject) ->
        if isSame(subject, @subject)
          for key, value of subject
            @subject[key] = value

      createCast: (cast) ->
        if @isSame(cast.subject, @subject)
          @inc(@subject, 'castCount')

      removeCast: (cast) ->
        if @isSame(cast.subject, @subject)
          @dec(@subject, 'castCount')

      createStaff: (staff) ->
        if @isSame(staff.subject, @subject)
          @inc(@subject, 'staffCount')

      removeStaff: (staff) ->
        if @isSame(staff.subject, @subject)
          @dec(@subject, 'staffCount')

      createEpisode: (episode) ->
        if @isSame(episode.subject, @subject)
          @inc(@subject, 'episodeCount')

      createEpisodes: (episodes) ->
        for episode in episodes
          if @isSame(episode.subject, @subject)
            @inc(@subject, 'episodeCount')

      removeEpisode: (episode) ->
        if @isSame(episode.subject, @subject)
          @dec(@subject, 'episodeCount')
</script>
