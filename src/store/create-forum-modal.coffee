module.exports =

  state:
    open: false

  mutations:
    'create-forum-modal/SHOW': (state) ->
      state.open = true

    'create-forum-modal/HIDE': (state) ->
      state.open = false