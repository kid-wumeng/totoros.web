module.exports =

  state:
    open: false
    organization: null
    records: []

  mutations:
    UPDATE_ORGANIZATION: (state, organization) ->
      state.organization = organization

    'edit-organization-base-modal/SHOW': (state, {organization, records=[]}) ->
      state.open = true
      state.organization = organization
      state.records = records

    'edit-organization-base-modal/HIDE': (state) ->
      state.open = false
      state.organization = null
      state.records = []

    'edit-organization-base-modal/ADD_RECORDS': (state, records) ->
      state.records = [records..., state.records...]

  actions:
    'edit-organization-base-modal/show': ({commit}, id) ->
      organization = await api.call('organization.get', id)
      records      = await api.call('organization.getEditRecords', id)
      commit('edit-organization-base-modal/SHOW', {organization, records})