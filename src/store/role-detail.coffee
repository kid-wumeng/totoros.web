module.exports =

  state:
    role: null

  mutations:
    UPDATE_ROLE: (state, role) ->
      if isSame(state.role, role)
        state.role = role

    'role-detail/SET_ROLE': (state, role) ->
      state.role = role

    'role-detail/RESET': (state) ->
      state.role = null

  actions:
    'role-detail/init': ({commit, dispatch}, id) ->
      commit('role-detail/RESET')
      dispatch('role-detail/loadRole', id)

    'role-detail/loadRole': ({commit}, id) ->
      role = await api.call('role.get', id)
      commit('role-detail/SET_ROLE', role)