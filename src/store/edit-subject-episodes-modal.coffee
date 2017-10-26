module.exports =

  state:
    open: false
    subject: null
    records: []

  mutations:
    UPDATE_SUBJECT: (state, subject) ->
      state.subject = subject

    'edit-subject-episodes-modal/SHOW': (state, {subject, records=[]}) ->
      state.open = true
      state.subject = subject
      state.records = records

    'edit-subject-episodes-modal/HIDE': (state) ->
      state.open = false
      state.subject = null
      state.records = []

    'edit-subject-episodes-modal/ADD_RECORD': (state, record) ->
      state.records = [record, state.records...]

  actions:
    'edit-subject-episodes-modal/show': ({commit}, id) ->
      subject = await api.call('subject.get', id, {episodes: true})
      records = await api.call('subject.getEditRecords', id, {type: 'episode'})
      commit('edit-subject-episodes-modal/SHOW', {subject, records})