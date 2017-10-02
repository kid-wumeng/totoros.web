module.exports =

  namespaced: true

  state:
    open: false
    subject: null

  mutations:
    SHOW: (state, subject) ->
      state.open = true
      state.subject = subject

    HIDE: (state) ->
      state.open = false

  actions:
    show: ({commit}, subject) ->
      api.call('subject.get', subject.id).done (subject) ->
        commit('SHOW', subject)