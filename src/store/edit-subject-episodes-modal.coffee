module.exports =

  state:
    open:     false
    subject:  null
    episodes: []
    records:  []

  mutations:
    CREATE_EPISODE: (state, episode) ->
      state.episodes.unshift(episode)

    CREATE_EPISODES: (state, episodes) ->
      state.episodes.unshift(episode) for episode in episodes

    UPDATE_EPISODE: (state, episode) ->
      update(state.episodes, episode)

    REMOVE_EPISODE: (state, episode) ->
      remove(state.episodes, episode)

    'edit-subject-episodes-modal/SHOW': (state, {subject, episodes, records}) ->
      state.open     = true
      state.subject  = subject
      state.episodes = episodes ? []
      state.records  = records  ? []

    'edit-subject-episodes-modal/HIDE': (state) ->
      state.open     = false
      state.subject  = null
      state.episodes = []
      state.records  = []

    'edit-subject-episodes-modal/ADD_RECORD': (state, record) ->
      state.records = [record, state.records...]

  actions:
    'edit-subject-episodes-modal/show': ({commit}, id) ->
      subject  = await api.call('subject.get', id)
      episodes = await api.call('episode.getAll', {sid: id, sort: '-order'})
      records  = await api.call('subject.getEditRecords', id, {type: 'episode'})
      commit('edit-subject-episodes-modal/SHOW', {subject, episodes, records})