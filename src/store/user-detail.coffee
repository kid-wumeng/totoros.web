module.exports =

  state:
    user: null
    anime_marks: []

  mutations:
    UPDATE_USER: (state, user) ->
      if(state.user?.id is user.id) then state.user = user

    ADD_USER_COMMENT: (state, {user, comment}) ->
      if(state.user?.id is user.id) then state.comments.push(comment)

    'user-detail/SET_USER': (state, user) ->
      state.user = user

    'user-detail/SET_ANIME_MARKS': (state, anime_marks) ->
      state.anime_marks = anime_marks

  actions:
    'user-detail/init': ({commit, dispatch}, id) ->
      commit('user-detail/SET_USER', null)
      commit('user-detail/SET_ANIME_MARKS', [])
      dispatch('user-detail/get-user', id)

    'user-detail/get-user': ({commit}, id) ->
      user = await api.call('user.get', id)
      commit('user-detail/SET_USER', user)

    'user-detail/get-anime-marks': ({state, commit}, {id, page=1}) ->
      uid    = id
      types  = model.subject.unfoldType('anime')
      result = await api.call('mark.getAll', {uid, types, page})
      commit('user-detail/SET_ANIME_MARKS', result.marks)