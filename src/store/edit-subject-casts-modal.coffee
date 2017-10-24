module.exports =

  state:
    open: false
    subject: null
    records: []

  mutations:
    UPDATE_SUBJECT: (state, subject) ->
      state.subject = subject

    'edit-subject-casts-modal/SHOW': (state, {subject, records=[]}) ->
      state.open = true
      state.subject = subject
      state.records = records

    'edit-subject-casts-modal/HIDE': (state) ->
      state.open = false
      state.subject = null
      state.records = []

    'edit-subject-casts-modal/ADD_RECORD': (state, record) ->
      state.records = [record, state.records...]

  actions:
    'edit-subject-casts-modal/show': ({commit}, id) ->
      subject = await api.call('subject.get', id, {casts: true})
      records = await api.call('subject.getEditRecords', id, {type: 'cast'})
      commit('edit-subject-casts-modal/SHOW', {subject, records})