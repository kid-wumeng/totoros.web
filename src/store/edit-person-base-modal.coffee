module.exports =

  state:
    open: false
    person: null
    records: []

  mutations:
    UPDATE_PERSON: (state, person) ->
      state.person = person

    'edit-person-base-modal/SHOW': (state, {person, records=[]}) ->
      state.open    = true
      state.person  = person
      state.records = records

    'edit-person-base-modal/HIDE': (state) ->
      state.open    = false
      state.person  = null
      state.records = []

    'edit-person-base-modal/ADD_RECORDS': (state, records) ->
      state.records = [records..., state.records...]

  actions:
    'edit-person-base-modal/show': ({commit}, id) ->
      person  = await api.call('person.get', id)
      records = await api.call('person.getEditBaseRecords', id)
      commit('edit-person-base-modal/SHOW', {person, records})