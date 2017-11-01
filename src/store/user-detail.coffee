module.exports =

  state:
    user: null
    anime_marks: []
    comic_marks: []
    game_marks:  []

  mutations:
    UPDATE_USER: (state, user) ->
      if(state.user?.id is user.id) then state.user = user

    ADD_USER_COMMENT: (state, {user, comment}) ->
      if(state.user?.id is user.id) then state.comments.push(comment)

    UPDATE_MARK: (state, mark) ->
      update(state.anime_marks, mark)
      update(state.comic_marks, mark)
      update(state.game_marks,  mark)

    'user-detail/SET_USER': (state, user) ->
      state.user = user

    'user-detail/SET_ANIME_MARKS': (state, anime_marks) ->
      state.anime_marks = anime_marks

    'user-detail/SET_COMIC_MARKS': (state, comic_marks) ->
      state.comic_marks = comic_marks

    'user-detail/SET_GAME_MARKS': (state, game_marks) ->
      state.game_marks = game_marks

  actions:
    'user-detail/init': ({commit, dispatch}, id) ->
      commit('user-detail/SET_USER', null)
      commit('user-detail/SET_ANIME_MARKS', [])
      dispatch('user-detail/get-user', id)

    'user-detail/get-user': ({commit}, id) ->
      user = await api.call('user.get', id)
      commit('user-detail/SET_USER', user)

    'user-detail/get-marks': ({commit}, {id, type, status, page=1}) ->
      return new Promise (resolve) ->
        result = await api.call('mark.getAll', {
          uid:    id
          types:  model.subject.unfoldType(type)
          status: status
          page:   page
          sort: '-average'
        })
        resolve(result.marks)

    'user-detail/get-anime-marks': ({commit, dispatch}, {id, type, status, page}) ->
      marks = await dispatch('user-detail/get-marks', {id, type, status, page})
      commit('user-detail/SET_ANIME_MARKS', marks)

    'user-detail/get-comic-marks': ({commit, dispatch}, {id, type, status, page}) ->
      marks = await dispatch('user-detail/get-marks', {id, type, status, page})
      commit('user-detail/SET_COMIC_MARKS', marks)

    'user-detail/get-game-marks': ({commit, dispatch}, {id, type, status, page}) ->
      marks = await dispatch('user-detail/get-marks', {id, type, status, page})
      commit('user-detail/SET_GAME_MARKS', marks)
