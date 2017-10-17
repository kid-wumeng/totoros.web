module.exports =

  state:
    user: null

  getters:
    'login': (state) ->
      id = state.user?.id
      return typeof(id) is 'number' and id > 0

  mutations:
    'account/CHECKIN_DONE': (state, user) ->
      state.user = user

  actions:
    'account/checkin': ({commit}) ->
      tokenString = localStorage.getItem('tokenString')
      if(tokenString)
        result = await api.call('account.checkin', tokenString)
        localStorage.setItem('tokenString', result.tokenString)
        commit('account/CHECKIN_DONE', result.user)