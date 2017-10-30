module.exports =

  state:
    open:    false
    subject: null
    staffs:  []
    records: []

  mutations:
    CREATE_STAFF: (state, staff) ->
      state.staffs.push(staff)

    UPDATE_STAFF: (state, staff) ->
      update(state.staffs, staff)

    REMOVE_STAFF: (state, staff) ->
      remove(state.staffs, staff)

    'edit-subject-staffs-modal/SHOW': (state, {subject, staffs, records}) ->
      state.open    = true
      state.subject = subject
      state.staffs  = staffs  ? []
      state.records = records ? []

    'edit-subject-staffs-modal/HIDE': (state) ->
      state.open    = false
      state.subject = null
      state.staffs  = []
      state.records = []

    'edit-subject-staffs-modal/ADD_RECORD': (state, record) ->
      state.records = [record, state.records...]

  actions:
    'edit-subject-staffs-modal/show': ({commit}, id) ->
      subject = await api.call('subject.get', id)
      staffs  = await api.call('staff.getAll', {sid: id})
      records = await api.call('subject.getEditRecords', id, {type: 'staff'})
      commit('edit-subject-staffs-modal/SHOW', {subject, staffs, records})