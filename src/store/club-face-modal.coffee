module.exports =

  state:
    open: false
    club: null

  mutations:
    'club-face-modal/SHOW': (state, club) ->
      state.club = club
      state.open  = true

    'club-face-modal/HIDE': (state) ->
      state.club = null
      state.open  = false

  actions:
    'club-face-modal/show': ({dispatch, commit}, id) ->
      club = await api.call('club.get', id)
      commit('club-face-modal/SHOW', club)