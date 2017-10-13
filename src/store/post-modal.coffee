module.exports =

  state:
    open:  false
    forum: null
    post:  null

  mutations:
    'post-modal/SHOW': (state, {forum, post}) ->
      state.open  = true
      state.forum = forum
      state.post  = post

    'post-modal/HIDE': (state) ->
      state.open  = false
      state.forum = null
      state.post  = null

  actions:
    'post-modal/show': ({commit}, {forum, post}) ->
      if post
        api.call('post.get', post.id).done (post) ->
          commit('input-content/SET_CONTENT', post.content)
          commit('input-content/SET_PICTURES', post.pictures)
          commit('post-modal/SHOW', {post})
      else
        commit('input-content/SET_CONTENT', '')
        commit('input-content/SET_PICTURES', [])
        commit('post-modal/SHOW', {forum})