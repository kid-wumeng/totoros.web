module.exports =

  state:
    open: false
    organization: null
    records: []

  mutations:
    SHOW_EDIT_ORGANIZATION_BASE_MODAL: (state, {organization, records=[]}) ->
      state.open = true
      state.organization = organization
      state.records = records

    HIDE_EDIT_ORGANIZATION_BASE_MODAL: (state) ->
      state.open = false
      state.organization = null
      state.records = []

    UPDATE_ORGANIZATION: (state, organization) ->
      state.organization = organization

    ADD_EDIT_ORGANIZATION_BASE_RECORDS: (state, records) ->
      state.records = [records..., state.records...]

  actions:
    'show-edit-organization-base-modal': ({commit}, id) ->
      api.call('organization.get', id).done (organization) =>
        api.call('organization.getEditBaseRecords', id).done (records) =>
          commit('SHOW_EDIT_ORGANIZATION_BASE_MODAL', {organization, records})