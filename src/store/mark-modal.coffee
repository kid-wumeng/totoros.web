module.exports =

  state:
    open:       false
    subject:    null
    mark:       null
    episodes:   []
    initStatus: ''

  mutations:
    'mark-modal/SHOW': (state, {subject, mark, episodes, initStatus}) ->
      state.open       = true
      state.subject    = subject
      state.mark       = mark
      state.episodes   = episodes   ? []
      state.initStatus = initStatus ? 'done'

    'mark-modal/HIDE': (state) ->
      state.open       = false
      state.subject    = null
      state.mark       = null
      state.episodes   = []
      state.initStatus = ''

  actions:
    'mark-modal/show': ({commit}, {subject, initStatus}) ->
      mark     = await api.call('mark.sure', subject.id)
      episodes = await api.call('episode.getAll', {sid: subject.id})
      commit('mark-modal/SHOW', {subject, mark, episodes, initStatus})