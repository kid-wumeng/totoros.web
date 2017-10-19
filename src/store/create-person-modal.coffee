module.exports =

  state:
    open: false

  mutations:
    'create-person-modal/SHOW': (state) ->
      state.open = true

    'create-person-modal/HIDE': (state) ->
      state.open = false