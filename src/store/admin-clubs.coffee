module.exports =

  state:
    clubs: []

  mutations:
    CREATE_CLUB: (state, club) ->
      state.clubs.push(club)

    UPDATE_CLUB: (state, updateClub) ->
      for club, i in state.clubs
        if isSame(club, updateClub)
          Vue.set(state.clubs, i, updateClub)

    'admin-clubs/SET_ITEMS': (state, clubs) ->
      state.clubs = clubs

  actions:
    'admin-clubs/init': ({dispatch}) ->
      dispatch('admin-clubs/loadClubs')

    'admin-clubs/loadClubs': ({commit}) ->
      result = await api.call('club.getAll')
      commit('admin-clubs/SET_ITEMS', result.clubs)