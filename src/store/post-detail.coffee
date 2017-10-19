module.exports =

  state:
    post: null
    comments: []

  mutations:
    UPDATE_POST: (state, post) ->
      if isSame(state.post, post)
        state.post = post

    ADD_POST_COMMENT: (state, {post, comment}) ->
      if isSame(state.post, post)
        state.comments.push(comment)

    'post-detail/SET_POST': (state, post) ->
      state.post = post

    'post-detail/SET_COMMENTS': (state, comments) ->
      state.comments = comments

  actions:
    'post-detail/loadPost': ({state, commit}, {id}) ->
      commit('post-detail/SET_POST', null)
      post = await api.call('post.get', id)
      commit('post-detail/SET_POST', post)

    'post-detail/loadComments': ({state, commit}, {id, page}) ->
      commit('post-detail/SET_COMMENTS', [])
      comments = await api.call('post.getComments', id, page)
      commit('post-detail/SET_COMMENTS', comments)