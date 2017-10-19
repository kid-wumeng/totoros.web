module.exports =

  state:
    user: null

  getters:
    'login': (state) ->
      id = state.user?.id
      return typeof(id) is 'number' and id > 0

  mutations:
    'account/SET_USER': (state, user) ->
      state.user = user

  actions:
    'account/checkin': ({commit}) ->
      tokenString = localStorage.getItem('tokenString')
      if(tokenString)
        result = await api.call('account.checkin', tokenString)
        localStorage.setItem('tokenString', result.tokenString)
        commit('account/SET_USER', result.user)