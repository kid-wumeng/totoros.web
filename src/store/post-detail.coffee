module.exports =

  state:
    post: null

  mutations:
    'UPDATE_POST': (state, post) ->
      if(state.post.id is post.id)
        state.post = post

    'post-detail/SET_POST': (state, post) ->
      state.post = post

    'post-detail/CLEAN': (state) ->
      state.post = null

  actions:
    'post-detail/load': ({commit}, id) ->
      commit('post-detail/CLEAN')
      api.call('post.get', id).done (post) -> commit('post-detail/SET_POST', post)