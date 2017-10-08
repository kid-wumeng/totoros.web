module.exports =

  state:
    open:    false
    subject: null
    mark:    null
    initStatus: ''

  mutations:
    SHOW_MARK_MODAL: (state, {subject, mark, initStatus}) ->
      state.open    = true
      state.subject = subject
      state.mark    = mark
      state.initStatus = initStatus ? 'done'

    HIDE_MARK_MODAL: (state) ->
      state.open    = false
      state.subject = null
      state.mark    = null
      state.initStatus = ''

  actions:
    'show-mark-modal': ({commit}, {subject, initStatus}) ->
      api.call('mark.sure', subject.id).done (mark) ->
        commit('SHOW_MARK_MODAL', {subject, mark, initStatus})