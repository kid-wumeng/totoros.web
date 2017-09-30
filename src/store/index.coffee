Vue  = require('vue').default
Vuex = require('vuex')

Vue.use(Vuex)

module.exports = new Vuex.Store({

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

  modules:
    totoro: require('./totoro')
    notify: require('./notify')
})