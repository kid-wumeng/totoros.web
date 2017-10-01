module.exports =

  namespaced: true

  state:
    user: null

  mutations:
    CHECKIN_DONE: (state, user) ->
      state.user = user

  actions:
    checkin: ({commit}) ->
      tokenString = localStorage.getItem('tokenString')
      if(tokenString)
        api.call('user.account.checkin', tokenString).done ({user, tokenString}) ->
          localStorage.setItem('tokenString', tokenString)
          commit('CHECKIN_DONE', user)