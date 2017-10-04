module.exports =

  state:
    open: false
    subject: null
    records: []

  mutations:
    SHOW_EDIT_SUBJECT_BASE_MODAL: (state, {subject, records=[]}) ->
      state.open = true
      state.subject = subject
      state.records = records

    HIDE_EDIT_SUBJECT_BASE_MODAL: (state) ->
      state.open = false
      state.subject = null
      state.records = []

    UPDATE_SUBJECT: (state, subject) ->
      state.subject = subject

    ADD_EDIT_SUBJECT_BASE_RECORDS: (state, records) ->
      state.records = [records..., state.records...]

  actions:
    'show-edit-subject-base-modal': ({commit}, id) ->
      api.call('subject.get', id).done (subject) =>
        api.call('subject.getEditBaseRecords', id).done (records) =>
          commit('SHOW_EDIT_SUBJECT_BASE_MODAL', {subject, records})