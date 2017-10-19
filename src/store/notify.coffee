module.exports =

  state:
    open: false
    type: ''
    message: ''
    timer: null

  mutations:
    'notify/SHOW': (state, {type, message}) ->
      state.open = true
      state.type = type
      state.message = message

    'notify/HIDE': (state) ->
      state.open = false

    'notify/SET_TIMER': (state, timer) ->
      state.timer = timer

    'notify/CLEAR_TIMER': (state) ->
      clearTimeout(state.timer)
      state.timer = false

  actions:
    'notify/show': ({commit}, {type, message, duration=2000}) ->
      commit('notify/CLEAR_TIMER')
      commit('notify/SHOW', {type, message})
      timer = setTimeout (-> commit('notify/HIDE')), duration
      commit('notify/SET_TIMER', timer)