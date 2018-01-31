module.exports =

  state:
    open:   false
    forums: []
    post:   null

  mutations:
    'move-post-modal/SHOW': (state, {forums, post}) ->
      state.open   = true
      state.forums = forums
      state.post   = post

    'move-post-modal/HIDE': (state) ->
      state.open   = false
      state.forums = []
      state.post   = null

  actions:
    'move-post-modal/show': ({commit}, post) ->
      forums = await api.call('forum.getAll')
      forums ?= []
      forums = forums.filter (forum) -> forum.id isnt post.forum.id
      commit('move-post-modal/SHOW', {forums, post})