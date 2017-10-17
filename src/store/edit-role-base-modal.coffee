module.exports =

  state:
    open: false
    role: null
    records: []

  mutations:
    SHOW_EDIT_ROLE_BASE_MODAL: (state, {role, records=[]}) ->
      state.open = true
      state.role = role
      state.records = records

    HIDE_EDIT_ROLE_BASE_MODAL: (state) ->
      state.open = false
      state.role = null
      state.records = []

    UPDATE_ROLE: (state, role) ->
      state.role = role

    ADD_EDIT_ROLE_BASE_RECORDS: (state, records) ->
      state.records = [records..., state.records...]

  actions:
    'show-edit-role-base-modal': ({commit}, id) ->
      role = await api.call('role.get', id)
      records = await api.call('role.getEditBaseRecords', id)
      commit('SHOW_EDIT_ROLE_BASE_MODAL', {role, records})