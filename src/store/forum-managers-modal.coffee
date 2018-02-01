module.exports =

  state:
    open: false
    forum: null

  mutations:
    'forum-managers-modal/SHOW': (state, forum) ->
      state.forum = forum
      state.open  = true

    'forum-managers-modal/HIDE': (state) ->
      state.forum = null
      state.open  = false

    'forum-managers-modal/ADD_MANAGER': (state, user) ->
      managers = state.forum.managers ? []
      managers.push(user)
      Vue.set(state.forum, 'managers', managers)

    'forum-managers-modal/DEL_MANAGER': (state, manager) ->
      managers = state.forum.managers ? []
      managers = managers.filter (user) -> user.id isnt manager.id
      Vue.set(state.forum, 'managers', managers)

  actions:
    'forum-managers-modal/show': ({dispatch, commit}, id) ->
      forum = await api.call('forum.get', id)
      commit('forum-managers-modal/SHOW', forum)