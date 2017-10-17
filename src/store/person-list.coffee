module.exports =

  state:
    items: []

  mutations:
    UPDATE_PERSON: (state, person) ->
      Vue.set(state.items, person.id, person)

  actions:
    'get-person': ({commit}, id) ->
      person = await api.call('person.get', id)
      commit('UPDATE_PERSON', person)