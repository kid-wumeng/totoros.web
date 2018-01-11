module.exports =

  state:
    open: false
    comment: null

  mutations:
    'comment-modal/SHOW': (state, {comment}) ->
      state.open = true
      state.comment = comment

    'comment-modal/HIDE': (state) ->
      state.open = false
      state.comment = null

  actions:
    'comment-modal/show': ({commit}, {comment}) ->
      comment = await api.call('comment.get', comment.id)
      commit('input-content/SET_CONTENT', comment.content)
      commit('comment-modal/SHOW', {comment})