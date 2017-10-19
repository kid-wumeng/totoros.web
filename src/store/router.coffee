module.exports =

  state:
    justBack: false

  mutations:
    'router/SET_JUST_BACK': (state, justBack) ->
      state.justBack = justBack