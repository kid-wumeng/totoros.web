module.exports =

  state:
    subject: null
    mark: []
    markSure: false

  mutations:
    UPDATE_SUBJECT: (state, subject) ->
      if isSame(state.subject, subject)
        state.subject = subject

    'subject-detail/SET_SUBJECT': (state, subject) ->
      state.subject = subject

    'subject-detail/SET_MARK': (state, mark) ->
      state.mark     = mark
      state.markSure = true

    'subject-detail/RESET': (state) ->
      state.subject  = null
      state.mark     = null
      state.markSure = false

  actions:
    'subject-detail/init': ({commit, dispatch}, id) ->
      commit('subject-detail/RESET')
      dispatch('subject-detail/load-subject', id)
      dispatch('subject-detail/sure-mark', id)

    'subject-detail/load-subject': ({commit}, id) ->
      subject = await api.call('subject.get', id)
      commit('subject-detail/SET_SUBJECT', subject)

    'subject-detail/sure-mark': ({state, commit}, id) ->
      mark = await api.call('mark.sure', id)
      commit('subject-detail/SET_MARK', mark)