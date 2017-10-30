module.exports =

  state:
    open:    false
    subject: null
    records: []

  mutations:
    UPDATE_SUBJECT: (state, subject) ->
      if isSame(state.subject, subject)
        state.subject = subject

    'edit-subject-resources-modal/SHOW': (state, {subject, records}) ->
      state.open    = true
      state.subject = subject
      state.records = records ? []

    'edit-subject-resources-modal/HIDE': (state) ->
      state.open    = false
      state.subject = null
      state.records = []

    'edit-subject-resources-modal/ADD_RECORD': (state, record) ->
      state.records = [record, state.records...]

  actions:
    'edit-subject-resources-modal/show': ({commit}, id) ->
      subject = await api.call('subject.get', id)
      records = await api.call('subject.getEditRecords', id, {type: 'resource'})
      commit('edit-subject-resources-modal/SHOW', {subject, records})