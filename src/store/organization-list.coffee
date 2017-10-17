module.exports =

  state:
    items: []

  mutations:
    UPDATE_ORGANIZATION: (state, organization) ->
      Vue.set(state.items, organization.id, organization)

  actions:
    'get-organization': ({commit}, id) ->
      organization = await api.call('organization.get', id)
      commit('UPDATE_ORGANIZATION', organization)