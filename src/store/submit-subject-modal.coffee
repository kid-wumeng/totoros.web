module.exports =

  state:
    open: false

  mutations:
    SHOW_SUBMIT_SUBJECT_MODAL: (state) ->
      state.open = true

    HIDE_SUBMIT_SUBJECT_MODAL: (state) ->
      state.open = false