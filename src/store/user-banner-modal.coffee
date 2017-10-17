module.exports =

  state:
    open: false

  mutations:
    'user-banner-modal/SHOW': (state) ->
      state.open = true

    'user-banner-modal/HIDE': (state) ->
      state.open = false