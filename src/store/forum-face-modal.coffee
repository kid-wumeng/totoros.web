module.exports =

  state:
    open: false
    forum: null

  mutations:
    'forum-face-modal/SHOW': (state, forum) ->
      state.forum = forum
      state.open  = true

    'forum-face-modal/HIDE': (state) ->
      state.forum = null
      state.open  = false

  actions:
    'forum-face-modal/show': ({dispatch, commit}, id) ->
      forum = await api.call('forum.get', id)
      commit('forum-face-modal/SHOW', forum)