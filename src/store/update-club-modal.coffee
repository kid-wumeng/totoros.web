module.exports =

  state:
    open: false
    club: null

  mutations:
    UPDATE_CLUB: (state, club) ->
      state.club = club

    'update-club-modal/SHOW': (state, club) ->
      state.open  = true
      state.club = club

    'update-club-modal/HIDE': (state) ->
      state.open  = false
      state.club = null

  actions:
    'update-club-modal/show': ({commit}, id) ->
      club = await api.call('club.get', id)
      commit('update-club-modal/SHOW', club)