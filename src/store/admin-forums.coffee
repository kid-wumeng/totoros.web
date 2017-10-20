module.exports =

  state:
    forums: []

  mutations:
    CREATE_FORUM: (state, forum) ->
      state.forums.push(forum)

    UPDATE_FORUM: (state, updateForum) ->
      for forum, i in state.forums
        if isSame(forum, updateForum)
          Vue.set(state.forums, i, updateForum)

    'admin-forums/SET_ITEMS': (state, forums) ->
      state.forums = forums

  actions:
    'admin-forums/init': ({dispatch}) ->
      dispatch('admin-forums/loadForums')

    'admin-forums/loadForums': ({commit}) ->
      result = await api.call('forum.getAll')
      commit('admin-forums/SET_ITEMS', result.forums)