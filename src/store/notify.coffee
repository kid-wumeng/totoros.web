module.exports =

  namespaced: true

  # 可选类型：done/warn/fail
  state:
    open: false
    type: ''
    message: ''
    timer: null

  mutations:
    SHOW: (state, {type, message}) ->
      state.open = true
      state.type = type
      state.message = message

    HIDE: (state) ->
      state.open = false

    SET_TIMER: (state, timer) ->
      state.timer = timer

    CLEAR_TIMER: (state) ->
      clearTimeout(state.timer)
      state.timer = false

  actions:
    show: ({ commit }, {type, message, duration=2000}) ->
      commit('CLEAR_TIMER')
      commit('SHOW', {type, message})
      timer = setTimeout (-> commit('HIDE')), duration
      commit('SET_TIMER', timer)