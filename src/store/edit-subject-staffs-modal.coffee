module.exports =

  state:
    open: false
    subject: null
    records: []

  mutations:
    UPDATE_SUBJECT: (state, subject) ->
      state.subject = subject

    'edit-subject-staffs-modal/SHOW': (state, {subject, records=[]}) ->
      state.open = true
      state.subject = subject
      state.records = records

    'edit-subject-staffs-modal/HIDE': (state) ->
      state.open = false
      state.subject = null
      state.records = []

    'edit-subject-staffs-modal/ADD_RECORD': (state, record) ->
      state.records = [record, state.records...]

  actions:
    'edit-subject-staffs-modal/show': ({commit}, id) ->
      subject = await api.call('subject.get', id, {staffs: true})
      records = await api.call('subject.getEditRecords', id, {type: 'staff'})
      commit('edit-subject-staffs-modal/SHOW', {subject, records})