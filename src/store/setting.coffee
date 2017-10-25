module.exports =

  state:
    user: null

  mutations:
    UPDATE_USER: (state, user) ->
      if isSame(state.user, user)
        state.user = user

    'setting/SET_USER': (state, user) ->
      state.user = user

  actions:
    'setting/init': ({dispatch}, id) ->
      dispatch('setting/load-user')

    'setting/load-user': ({commit}, id) ->
      user = await api.call('user.get', id)
      commit('setting/SET_USER', user)