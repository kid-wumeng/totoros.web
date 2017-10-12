module.exports =

  state:
    posts: []
    total: 0

  mutations:
    'CREATE_POST': (state, post) ->
      state.posts.unshift(post)

    'UPDATE_POST': (state, updatePost) ->
      for post, i in state.posts
        if post.id is updatePost.id
          Vue.set(state.posts, i, updatePost)

    'post-list/SET_ITEMS': (state, posts) ->
      state.posts = posts

    'post-list/SET_TOTAL': (state, total) ->
      state.total = total

    'post-list/CLEAN': (state) ->
      state.posts = []
      state.total = 0

  actions:
    'post-list/load': ({commit}, fid) ->
      commit('post-list/CLEAN')
      api.call('post.getAll', {fid}).done (result) ->
        commit('post-list/SET_ITEMS', result.posts)
        commit('post-list/SET_TOTAL', result.total)