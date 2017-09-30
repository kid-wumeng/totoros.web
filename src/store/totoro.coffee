module.exports =

  namespaced: true

  state:
    open: false
    message: ''
    timer: null

  mutations:
    SHOW_MESSAGE: (state, message) ->
      state.message = message
      state.open = true

    HIDE_MESSAGE: (state) ->
      state.open = false

    SET_TIMER: (state, timer) ->
      state.timer = timer

    CLEAR_TIMER: (state) ->
      clearTimeout(state.timer)
      state.timer = false

  actions:
    showMessage: ({commit}, {message, duration=0}) ->
      commit('CLEAR_TIMER')
      commit('SHOW_MESSAGE', message)
      if(duration)
        timer = setTimeout (-> commit('HIDE_MESSAGE')), duration
        commit('SET_TIMER', timer)