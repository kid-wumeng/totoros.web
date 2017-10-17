module.exports =

  state:
    items: []

  mutations:
    UPDATE_ROLE: (state, role) ->
      Vue.set(state.items, role.id, role)

  actions:
    'get-role': ({commit}, id) ->
      role = await api.call('role.get', id)
      commit('UPDATE_ROLE', role)