module.exports =

  state:
    subject:  null
    mark:     null
    markSure: false
    episodes: []
    casts:    []
    staffs:   []

  mutations:
    UPDATE_SUBJECT: (state, subject) ->
      if isSame(state.subject, subject)
        state.subject = subject

    CREATE_MARK: (state, mark) ->
      if isSame(state.subject, mark.subject)
        state.mark = mark

    UPDATE_MARK: (state, mark) ->
      if isSame(state.subject, mark.subject)
        state.mark = mark

    CREATE_CAST: (state, cast) ->
      state.casts.push(cast)
      inc(state.subject, 'castCount')

    UPDATE_CAST: (state, cast) ->
      update(state.casts, cast)

    REMOVE_CAST: (state, cast) ->
      if remove(state.casts, cast)
        state.subject.castCount--

    CREATE_STAFF: (state, staff) ->
      state.staffs.push(staff)
      inc(state.subject, 'staffCount')

    UPDATE_STAFF: (state, staff) ->
      update(state.staffs, staff)

    REMOVE_STAFF: (state, staff) ->
      if remove(state.staffs, staff)
        state.subject.staffCount--

    CREATE_EPISODE: (state, episode) ->
      state.episodes.push(episode)
      inc(state.subject, 'episodeCount')

    CREATE_EPISODES: (state, episodes) ->
      state.episodes.push(episode) for episode in episodes
      inc(state.subject, 'episodeCount', episodes.length)

    UPDATE_EPISODE: (state, episode) ->
      update(state.episodes, episode)

    REMOVE_EPISODE: (state, episode) ->
      if remove(state.episodes, episode)
        state.subject.episodeCount--

    'subject-detail/SET_SUBJECT': (state, subject) ->
      state.subject = subject

    'subject-detail/SET_MARK': (state, mark) ->
      state.mark     = mark
      state.markSure = true

    'subject-detail/SET_EPISODES': (state, episodes) ->
      state.episodes = episodes

    'subject-detail/SET_CASTS': (state, casts) ->
      state.casts = casts

    'subject-detail/SET_STAFFS': (state, staffs) ->
      state.staffs = staffs

    'subject-detail/RESET': (state) ->
      state.subject  = null
      state.mark     = null
      state.markSure = false
      state.episodes = []
      state.casts    = []
      state.staffs   = []

  actions:
    'subject-detail/init': ({commit, dispatch}, id) ->
      commit('subject-detail/RESET')
      dispatch('subject-detail/loadSubject', id)

    'subject-detail/loadSubject': ({commit}, id) ->
      subject = await api.call('subject.get', id, {
        episodes: true
        casts:    true
        staffs:   true
      })
      commit('subject-detail/SET_SUBJECT', subject)

    'subject-detail/markSure': ({state, commit}, id) ->
      mark = await api.call('mark.sure', id)
      commit('subject-detail/SET_MARK', mark)

    'subject-detail/get-episodes': ({state, commit}, id) ->
      episodes = await api.call('episode.getAll', {sid: id})
      commit('subject-detail/SET_EPISODES', episodes)

    'subject-detail/get-casts': ({state, commit}, id) ->
      casts = await api.call('cast.getAll', {sid: id})
      commit('subject-detail/SET_CASTS', casts)

    'subject-detail/get-staffs': ({state, commit}, id) ->
      staffs = await api.call('staff.getAll', {sid: id})
      commit('subject-detail/SET_STAFFS', staffs)