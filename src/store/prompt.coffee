module.exports =

  state:
    open: false
    message: ''
    defaults: ''
    resolve: ->

  mutations:
    'prompt/SHOW': (state, {message, defaults, resolve}) ->
      state.open     = true
      state.message  = message
      state.defaults = defaults
      state.resolve  = resolve

    'prompt/HIDE': (state) ->
      state.open = false


  actions:
    'prompt/show': ({commit}, {message='', defaults=''}) ->
      return new Promise (resolve) ->
        commit('prompt/SHOW', {message, defaults, resolve})