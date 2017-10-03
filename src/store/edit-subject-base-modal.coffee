module.exports =

  namespaced: true

  state:
    open: false
    sid:  null

  mutations:
    SHOW: (state, sid) ->
      state.open = true
      state.sid  = sid

    HIDE: (state) ->
      state.open = false