module.exports =

  state:
    count: 0

  mutations:
    'reminder/SET_COUNT': (state, count) ->
      state.count = count

  actions:
    'reminder/check': ({commit}) ->
      count = await api.call('notice.getUnreadCount')
      commit('reminder/SET_COUNT', count)