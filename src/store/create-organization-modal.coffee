module.exports =

  state:
    open: false

  mutations:
    'create-organization-modal/SHOW': (state) ->
      state.open = true

    'create-organization-modal/HIDE': (state) ->
      state.open = false