module.exports =

  state:
    open: false
    message: ''
    timer: null

  mutations:
    SHOW_TOAST: (state, message) ->
      state.open = true
      state.message = message

    HIDE_TOAST: (state) ->
      state.open = false
      state.message = ''

    SET_TOAST_TIMER: (state, timer) ->
      state.timer = timer

    CLEAR_TOAST_TIMER: (state) ->
      clearTimeout(state.timer)
      state.timer = false

  actions:
    'show-toast': ({commit}, {message, duration=2000}) ->
      commit('CLEAR_TOAST_TIMER')
      commit('SHOW_TOAST', message)
      if(duration)
        timer = setTimeout (-> commit('HIDE_TOAST')), duration
      commit('SET_TOAST_TIMER', timer)