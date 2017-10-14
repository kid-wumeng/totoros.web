module.exports =

  state:
    items: []

  mutations:
    UPDATE_ORGANIZATION: (state, organization) ->
      Vue.set(state.items, organization.id, organization)

  actions:
    'get-organization': ({commit}, id) ->
      api.call('organization.get', id).done (organization) -> commit('UPDATE_ORGANIZATION', organization)