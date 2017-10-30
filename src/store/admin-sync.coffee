module.exports =

  state:
    progressOpen:   false
    progressTimer:  null
    progressSecond: 0
    progressOver:   false

  mutations:
    'admin-sync/SHOW_PROGRESS': (state) ->
      state.progressOpen = true

    'admin-sync/HIDE_PROGRESS': (state) ->
      state.progressOpen   = false
      state.progressSecond = 0
      state.progressOver   = false

    'admin-sync/SET_TIMER': (state, timer) ->
      state.progressTimer = timer

    'admin-sync/CLEAR_TIMER': (state) ->
      clearTimeout(state.progressTimer)
      state.progressTimer = null
      state.progressOver  = true

    'admin-sync/INC_SECOND': (state) ->
      state.progressSecond = state.progressSecond + 1

  actions:
    'admin-sync/show-progress': ({commit}) ->
      commit('admin-sync/SHOW_PROGRESS')
      timer = setInterval (-> commit('admin-sync/INC_SECOND')), 1000
      commit('admin-sync/SET_TIMER', timer)