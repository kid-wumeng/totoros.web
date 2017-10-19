module.exports =

  state:
    open: false
    role: null
    records: []

  mutations:
    UPDATE_ROLE: (state, role) ->
      state.role = role

    'edit-role-base-modal/SHOW': (state, {role, records=[]}) ->
      state.open = true
      state.role = role
      state.records = records

    'edit-role-base-modal/HIDE': (state) ->
      state.open = false
      state.role = null
      state.records = []

    'edit-role-base-modal/ADD_RECORDS': (state, records) ->
      state.records = [records..., state.records...]

  actions:
    'edit-role-base-modal/show': ({commit}, id) ->
      role    = await api.call('role.get', id)
      records = await api.call('role.getEditBaseRecords', id)
      commit('edit-role-base-modal/SHOW', {role, records})