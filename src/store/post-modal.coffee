module.exports =

  state:
    open:  false
    forum: null
    post:  null
    relativeSubjects: []

  mutations:
    'post-modal/SHOW': (state, {forum, post}) ->
      state.open  = true
      state.forum = forum
      state.post  = post
      state.relativeSubjects = post?.relativeSubjects ? []

    'post-modal/HIDE': (state) ->
      state.open  = false
      state.forum = null
      state.post  = null
      state.relativeSubjects = []

    'post-modal/ADD_RELATIVE_SUBJECT': (state, addSubject) ->
      for subject in state.relativeSubjects
        if isSame(subject, addSubject)
          return
      state.relativeSubjects.push(addSubject)

    'post-modal/DEL_RELATIVE_SUBJECT': (state, delSubject) ->
      removeItem(state.relativeSubjects, delSubject)

  actions:
    'post-modal/show': ({commit}, {forum, post}) ->
      if post
        post = await api.call('post.get', post.id)
        commit('input-content/SET_CONTENT', post.content)
        commit('post-modal/SHOW', {post})
      else
        commit('input-content/SET_CONTENT', '')
        commit('post-modal/SHOW', {forum})