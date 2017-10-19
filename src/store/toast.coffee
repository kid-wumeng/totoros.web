module.exports =

  state:
    open: false
    message: ''
    timer: null

  mutations:
    'toast/SHOW': (state, message) ->
      state.open = true
      state.message = message

    'toast/HIDE': (state) ->
      state.open = false
      state.message = ''

    'toast/SET_TIMER': (state, timer) ->
      state.timer = timer

    'toast/CLEAR_TIMER': (state) ->
      clearTimeout(state.timer)
      state.timer = false

  actions:
    'toast/show': ({commit}, {message, duration=2000}) ->
      commit('toast/CLEAR_TIMER')
      commit('toast/SHOW', message)
      if(duration)
        timer = setTimeout (-> commit('toast/HIDE')), duration
      commit('toast/SET_TIMER', timer)