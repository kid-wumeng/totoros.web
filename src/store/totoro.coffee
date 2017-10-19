module.exports =

  state:
    open: false
    message: ''
    timer: null

  mutations:
    'totoro/SHOW_MESSAGE': (state, message) ->
      state.message = message
      state.open = true

    'totoro/HIDE_MESSAGE': (state) ->
      state.open = false

    'totoro/SET_TIMER': (state, timer) ->
      state.timer = timer

    'totoro/CLEAR_TIMER': (state) ->
      clearTimeout(state.timer)
      state.timer = false

  actions:
    'totoro/showMessage': ({commit}, {message, duration=0}) ->
      commit('totoro/CLEAR_TIMER')
      commit('totoro/SHOW_MESSAGE', message)
      if(duration)
        timer = setTimeout (-> commit('totoro/HIDE_MESSAGE')), duration
        commit('totoro/SET_TIMER', timer)