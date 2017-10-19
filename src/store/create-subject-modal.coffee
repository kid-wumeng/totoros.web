module.exports =

  state:
    open: false

  mutations:
    'create-subject-modal/SHOW': (state) ->
      state.open = true

    'create-subject-modal/HIDE': (state) ->
      state.open = false