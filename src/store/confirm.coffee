module.exports =

  state:
    open: false
    message: ''
    resolve: ->

  mutations:
    'confirm/SHOW': (state, {message, resolve}) ->
      state.open    = true
      state.message = message
      state.resolve = resolve

    'confirm/HIDE': (state) ->
      state.open = false


  actions:
    'confirm/show': ({commit}, {message=''}) ->
      return new Promise (resolve) ->
        commit('confirm/SHOW', {message, resolve})