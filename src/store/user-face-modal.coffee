module.exports =

  state:
    open: false

  mutations:
    'user-face-modal/SHOW': (state) ->
      state.open = true

    'user-face-modal/HIDE': (state) ->
      state.open = false