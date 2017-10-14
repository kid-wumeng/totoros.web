module.exports =

  state:
    items: []

  mutations:
    UPDATE_PERSON: (state, person) ->
      Vue.set(state.items, person.id, person)

  actions:
    'get-person': ({commit}, id) ->
      api.call('person.get', id).done (person) -> commit('UPDATE_PERSON', person)