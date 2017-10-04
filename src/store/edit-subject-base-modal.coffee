module.exports =

  namespaced: true

  state:
    open:    false
    subject: null
    records: []

  mutations:
    SHOW: (state, subject) ->
      state.open    = true
      state.subject = subject

    HIDE: (state) ->
      state.open    = false
      state.subject = null
      state.records = []

    UPDATE_SUBJECT: (state, subject) ->
      state.subject = subject

    INSERT_RECORDS: (state, records) ->
      state.records = [records..., state.records...]

    APPEND_RECORDS: (state, records) ->
      state.records = [state.records..., records...]

  actions:
    show: ({commit}, id) ->
      api.call('subject.get', id).done (subject) =>
        commit('SHOW', subject)
        api.call('subject.getEditBaseRecords', id).done (records) =>
          commit('APPEND_RECORDS', records)