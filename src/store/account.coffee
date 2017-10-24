module.exports =

  state:
    user: null
    checkined: false

  getters:
    'login': (state) ->
      id = state.user?.id
      return typeof(id) is 'number' and id > 0

  mutations:
    'account/SET_USER': (state, user) ->
      state.user = user

    'account/SET_CHECKINED': (state, checkined) ->
      state.checkined = checkined

  actions:
    'account/checkin': ({commit}) ->
      tokenString = localStorage.getItem('tokenString')
      if(tokenString)
        result = await api.call('account.checkin', tokenString)
        localStorage.setItem('tokenString', result.tokenString)
        commit('account/SET_USER', result.user)
        commit('account/SET_CHECKINED', true)