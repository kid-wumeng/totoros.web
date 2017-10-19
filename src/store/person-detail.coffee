module.exports =

  state:
    person: null

  mutations:
    UPDATE_PERSON: (state, person) ->
      if isSame(state.person, person)
        state.person = person

    'person-detail/SET_PERSON': (state, person) ->
      state.person = person

    'person-detail/RESET': (state) ->
      state.person = null

  actions:
    'person-detail/init': ({commit, dispatch}, id) ->
      commit('person-detail/RESET')
      dispatch('person-detail/loadPerson', id)

    'person-detail/loadPerson': ({commit}, id) ->
      person = await api.call('person.get', id)
      commit('person-detail/SET_PERSON', person)