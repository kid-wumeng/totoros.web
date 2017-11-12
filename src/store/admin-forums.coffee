module.exports =

  state:
    forums: []

  mutations:
    CREATE_forum: (state, forum) ->
      state.forums.push(forum)

    UPDATE_forum: (state, updateforum) ->
      for forum, i in state.forums
        if isSame(forum, updateforum)
          Vue.set(state.forums, i, updateforum)

    'admin-forums/SET_ITEMS': (state, forums) ->
      state.forums = forums

  actions:
    'admin-forums/init': ({dispatch}) ->
      dispatch('admin-forums/loadforums')

    'admin-forums/loadforums': ({commit}) ->
      forums = await api.call('forum.getAll')
      commit('admin-forums/SET_ITEMS', forums)