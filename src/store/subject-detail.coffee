module.exports =

  state:
    subject: null
    mark: []
    markSure: false

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
      dispatch('subject-detail/loadSubject', id)
      dispatch('subject-detail/markSure', id)

    'subject-detail/loadSubject': ({commit}, id) ->
      subject = await api.call('subject.get', id)
      commit('subject-detail/SET_SUBJECT', subject)

    'subject-detail/markSure': ({state, commit}, id) ->
      mark = await api.call('mark.sure', id)
      commit('subject-detail/SET_MARK', mark)