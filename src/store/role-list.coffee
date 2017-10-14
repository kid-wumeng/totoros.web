module.exports =

  state:
    items: []

  mutations:
    UPDATE_ROLE: (state, role) ->
      Vue.set(state.items, role.id, role)

  actions:
    'get-role': ({commit}, id) ->
      api.call('role.get', id).done (role) -> commit('UPDATE_ROLE', role)