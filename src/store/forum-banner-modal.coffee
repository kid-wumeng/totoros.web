module.exports =

  state:
    open: false
    forum: null

  mutations:
    'forum-banner-modal/SHOW': (state, forum) ->
      state.forum = forum
      state.open  = true

    'forum-banner-modal/HIDE': (state) ->
      state.forum = null
      state.open  = false

  actions:
    'forum-banner-modal/show': ({dispatch, commit}, id) ->
      forum = await api.call('forum.get', id)
      commit('forum-banner-modal/SHOW', forum)