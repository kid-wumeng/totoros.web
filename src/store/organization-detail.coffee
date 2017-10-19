module.exports =

  state:
    organization: null

  mutations:
    UPDATE_ORGANIZATION: (state, organization) ->
      if isSame(state.organization, organization)
        state.organization = organization

    'organization-detail/SET_ORGANIZATION': (state, organization) ->
      state.organization = organization

    'organization-detail/RESET': (state) ->
      state.organization = null

  actions:
    'organization-detail/init': ({commit, dispatch}, id) ->
      commit('organization-detail/RESET')
      dispatch('organization-detail/loadOrganization', id)

    'organization-detail/loadOrganization': ({commit}, id) ->
      organization = await api.call('organization.get', id)
      commit('organization-detail/SET_ORGANIZATION', organization)