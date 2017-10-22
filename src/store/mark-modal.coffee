module.exports =

  state:
    open:    false
    subject: null
    mark:    null
    initStatus: ''

  mutations:
    'mark-modal/SHOW': (state, {subject, mark, initStatus}) ->
      state.open    = true
      state.subject = subject
      state.mark    = mark
      state.initStatus = initStatus ? 'done'

    'mark-modal/HIDE': (state) ->
      state.open    = false
      state.subject = null
      state.mark    = null
      state.initStatus = ''

  actions:
    'mark-modal/show': ({commit}, {subject, initStatus}) ->
      mark = await api.call('mark.sure', subject.id)
      commit('mark-modal/SHOW', {subject, mark, initStatus})