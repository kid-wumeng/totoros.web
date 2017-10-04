module.exports =

  state:
    open: false
    person: null
    records: []

  mutations:
    SHOW_EDIT_PERSON_BASE_MODAL: (state, {person, records=[]}) ->
      state.open    = true
      state.person  = person
      state.records = records

    HIDE_EDIT_PERSON_BASE_MODAL: (state) ->
      state.open    = false
      state.person  = null
      state.records = []

    UPDATE_PERSON: (state, person) ->
      state.person = person

    ADD_EDIT_PERSON_BASE_RECORDS: (state, records) ->
      state.records = [records..., state.records...]

  actions:
    'show-edit-person-base-modal': ({commit}, id) ->
      api.call('person.get', id).done (person) =>
        api.call('person.getEditBaseRecords', id).done (records) =>
          commit('SHOW_EDIT_PERSON_BASE_MODAL', {person, records})