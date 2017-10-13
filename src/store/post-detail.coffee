module.exports =

  state:
    post: null
    comments: []

  mutations:
    UPDATE_POST: (state, post) ->
      if(state.post?.id is post.id) then state.post = post

    ADD_POST_COMMENT: (state, {post, comment}) ->
      if(state.post?.id is post.id) then state.comments.push(comment)

    'post-detail/SET_POST': (state, post) ->
      state.post = post

    'post-detail/SET_COMMENTS': (state, comments) ->
      state.comments = comments

  actions:
    'post-detail/loadPost': ({state, commit}, {id}) ->
      commit('post-detail/SET_POST', null)
      api.call('post.get', id).done (post) -> commit('post-detail/SET_POST', post)

    'post-detail/loadComments': ({state, commit}, {id, page}) ->
      commit('post-detail/SET_COMMENTS', [])
      api.call('post.getComments', id, page).done (comments) -> commit('post-detail/SET_COMMENTS', comments)