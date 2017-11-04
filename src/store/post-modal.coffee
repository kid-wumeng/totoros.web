module.exports =

  state:
    open:  false
    club: null
    post:  null

  mutations:
    'post-modal/SHOW': (state, {club, post}) ->
      state.open  = true
      state.club = club
      state.post  = post

    'post-modal/HIDE': (state) ->
      state.open  = false
      state.club = null
      state.post  = null

  actions:
    'post-modal/show': ({commit}, {club, post}) ->
      if post
        post = await api.call('post.get', post.id)
        commit('input-content/SET_CONTENT', post.content)
        commit('input-content/SET_PICTURES', post.pictures)
        commit('post-modal/SHOW', {post})
      else
        commit('input-content/SET_CONTENT', '')
        commit('input-content/SET_PICTURES', [])
        commit('post-modal/SHOW', {club})