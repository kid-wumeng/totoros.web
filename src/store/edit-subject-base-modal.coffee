module.exports =

  state:
    open: false
    subject: null
    records: []

  mutations:
    UPDATE_SUBJECT: (state, subject) ->
      state.subject = subject
      
    'edit-subject-base-modal/SHOW': (state, {subject, records=[]}) ->
      state.open = true
      state.subject = subject
      state.records = records

    'edit-subject-base-modal/HIDE': (state) ->
      state.open = false
      state.subject = null
      state.records = []

    'edit-subject-base-modal/ADD_RECORDS': (state, records) ->
      state.records = [records..., state.records...]

  actions:
    'edit-subject-base-modal/show': ({commit}, id) ->
      subject = await api.call('subject.get', id)
      records = await api.call('subject.getEditBaseRecords', id)
      commit('edit-subject-base-modal/SHOW', {subject, records})