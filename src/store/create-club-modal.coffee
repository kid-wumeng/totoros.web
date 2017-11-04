module.exports =

  state:
    open: false

  mutations:
    'create-club-modal/SHOW': (state) ->
      state.open = true

    'create-club-modal/HIDE': (state) ->
      state.open = false