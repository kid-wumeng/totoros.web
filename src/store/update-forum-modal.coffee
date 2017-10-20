module.exports =

  state:
    open: false
    forum: null

  mutations:
    UPDATE_FORUM: (state, forum) ->
      state.forum = forum

    'update-forum-modal/SHOW': (state, forum) ->
      state.open  = true
      state.forum = forum

    'update-forum-modal/HIDE': (state) ->
      state.open  = false
      state.forum = null

  actions:
    'update-forum-modal/show': ({commit}, id) ->
      forum = await api.call('forum.get', id)
      commit('update-forum-modal/SHOW', forum)