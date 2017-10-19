module.exports =

  state:
    open: false

  mutations:
    'create-role-modal/SHOW': (state) ->
      state.open = true

    'create-role-modal/HIDE': (state) ->
      state.open = false