module.exports =

  namespaced: true

  state:
    open: false
    message: ''
    defaults: ''
    resolve: ->

  mutations:
    SHOW: (state, {message, defaults, resolve}) ->
      state.open     = true
      state.message  = message
      state.defaults = defaults
      state.resolve  = resolve

    HIDE: (state) ->
      state.open = false


  actions:
    show: ({commit}, {message='', defaults=''}) ->
      return new Promise (resolve) ->
        commit('SHOW', {message, defaults, resolve})